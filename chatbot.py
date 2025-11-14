from groq import Groq
import os
os.environ['SWI_HOME_DIR'] = r'C:\Program Files\swipl'  # Adjust path as needed
os.environ['PATH'] += os.pathsep + r'C:\Program Files\swipl\bin'

from pyswip import Prolog
from prompt import *

key = "" #type in your groq key here

client = Groq(api_key=key)
def main():
    prolog = Prolog()
    prolog.consult('knowledge_base.pl')
    '''
    prolog.consult('knowledge_base.pl')
    facts = ['courses(akshay,[])',
    'grade(akshay,11)',
    'plevel(akshay,math,veryhard)',
    'plevel(akshay,english,medium)',
    'plevel(akshay,social_studies,medium)',
    'plevel(akshay,science,veryhard)',
    'plevel(akshay,computer_science,hard)',
    'passion(akshay,computer_science)',
    'courses_not(akshay,[ap_chemistry,ap_biology,chinese_3_advanced])',
    'courses_wanted(akshay,[])',
    'credits_wanted(akshay,any)']
    '''
    #for fact in facts:
    #    prolog.assertz(fact)
    #print(list(prolog.query('give_recs(akshay,[math,english,social_studies,science],R,Prereqs)'))[0])

    
    questions = ["What grade are you in and what is your name? ","What subject is your passion? ","What level are you in each core subject as well as any other subjects you may wish to include? ","Type the subejcts you want in your schedule; if you don't care its fine just type all core subjects. ","How many credits do you want? ", "Are there any courses you don't want? ", "Are there any courses you want? ","What courses have you already taken so far? If you don't wanna type out just say that. "]
    knowledge_predicates = []
    predicates = []
    order = [context_grade,context_passion,context_p_level_subjects,context_subjects,context_credits_wanted,context_courses_not,context_courses_wanted,context_courses_taken]
    for i in range(len(questions)):
        context= order[i]
        
        response = "requery"

        while "requery" in response:
            inp = input(questions[i])
            completion = client.chat.completions.create(
                model="gemma2-9b-it",
                messages=[
                    
                    {
                        "role": "user",
                        "content": context+f"\nhere is the question the user was asked: {questions[i]}"+"\nbelow is the input from the user\n"+inp + "previous predicates regarding info about person" + str(knowledge_predicates)
                    }
                ],
                temperature=0,
                max_tokens=1024,
                top_p=1,
                stream=True,
                stop=None,
                )
            response = ""
            for chunk in completion:
                response+=chunk.choices[0].delta.content or ""
            print("response",response)
        if len(response.split('&'))>1:
            for pred in response.split('&'):
                if i==0:
                    knowledge_predicates.append(pred)
                elif i==1:
                    knowledge_predicates.append(pred)
                predicates.append(pred)
        else:
            if i ==0:
                knowledge_predicates.append(response)
            elif i ==1:
                knowledge_predicates.append(response)
            predicates.append(response)
                
        
    new_predicates = clean(predicates)
    print(new_predicates)
    for fact in new_predicates:
        prolog.assertz(fact)
    result = format_response(list(prolog.query(f"user(X),subjects(X,S),give_recs(X,S,R,Prereqs)"))[0])
    ans = input("\n\n"+result)
    result2 = justify_course(result, ans,new_predicates)
    while "done" not in result2:
        ans = input("\n"+result2)
        result2 = justify_course(result,ans,new_predicates)
    

def clean(preds):
    new_preds = []
    for pred in preds:
        new_preds.append(pred.replace('\n','').strip())
    return new_preds

def format_response(solution):
    context = context_reply_back
    completion = client.chat.completions.create(
                model="gemma2-9b-it",
                messages=[
                    
                    {
                        "role": "user",
                        "content": context + str(solution)
                    }
                ],
                temperature=1,
                max_tokens=1024,
                top_p=1,
                stream=True,
                stop=None,
                )
    response = ""
    for chunk in completion:
        response+=chunk.choices[0].delta.content or ""
    return response
def justify_course(allcourses,inp,predicates):
    context = context_justify
    completion = client.chat.completions.create(
                model="gemma2-9b-it",
                messages=[
                    
                    {
                        "role": "user",
                        "content": allcourses + "\n"+ context + "\nuser response:" + inp + "\n"+knowledge_about_courses+"\nBelow are the personal predicates of the user. Remember to only use relevant ones.\n"+str(predicates)
                    }
                ],
                temperature=1,
                max_tokens=1024,
                top_p=1,
                stream=True,
                stop=None,
                )
    response = ""
    for chunk in completion:
        response+=chunk.choices[0].delta.content or ""
    return response
    
if __name__ == "__main__":
    main()
