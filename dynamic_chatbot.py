from groq import Groq
import os
os.environ['SWI_HOME_DIR'] = r'C:\Program Files\swipl'  # Adjust path as needed
os.environ['PATH'] += os.pathsep + r'C:\Program Files\swipl\bin'
from pyswip import Prolog
from prompt import *
from openai import OpenAI
key = "" #enter your api key here
client2 = OpenAI(api_key=key)


client = Groq(api_key='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')

prolog = Prolog()
prolog.consult('knowledge_base.pl')
def main():
    #steps
    #1. get response from user
    #2. determine if response is query or knowledge given or both or none (probbaly use require and query types)
    #3. if response is a query, simply return the answer to that. if it is knowledge given then ask for more knowledge to determine a possible schedule (plevel, subjects,courses not/courses wanted) after generating schedule ask if they have taken the courses and if they wish to reveal which courses they have taken. 
    # if it is both then return answer and then ask for more knowledge to build schedule and let them know you are building a schedule.
    #4.  once all knowledge gotten, then set mode to create_schedule and create them a schedule. will need to have double response so i can properly extract that there is eneough info to create schedule (esp if last predicate is being given)
    #5. ask if they want to keep chatting; if not then erase all memory and previous predicates
    #6. repeat steps 1-5 over and over in infinite loop; chatbot should continously be running
    
    
    predicates=[]
    response = "Type to start a chat going --> "
    user_res = input(response)
    gpt_res = gpt_reply(user_res,predicates)
    running_predicates = []
    while "done" not in gpt_res:
        response = ""
        high_preds = gpt_res.split(";") #separate gpt responses with semicolon. ex: req(user:akshay);req(grade:akshay,11);req(plevel:math,hard);query(c_level,calculus_bc); Can you please tell me what your level is in science?
        running_predicates += high_preds
        ask_next = get_next_q(running_predicates) #if schedule is generated then this will be none
        #analyze_preds(high_preds) --> [[user(akshay),grade(akshay,11)],None,Calculus BC is a challenging course typically taken by 12th graders]
        print(analyze_preds(high_preds))
        answers_to_question = analyze_preds(high_preds)[2]
        query = analyze_preds(high_preds)[1]
        predicates+=(analyze_preds(high_preds)[0])
        
        response+= "\n"+answers_to_question #if no answer then it will be ""
        response += "\n"+ ask_next #ask_next will usually be a non-empty string unless the user is done giving knowledge/predicates and wants back a schedule; if only question is asked then response should ask for their name and grade
        humanized_result = "" #stores humanized generated schedule; if no schedule generated then null.
        
        
        if query:
            is_credits = False
            is_cw = False
            is_cnw = False
            is_courses = False
            for p in predicates:
                if 'credits_wanted' in p:
                    is_credits = True
                elif 'courses_wanted' in p:
                    is_cw = True
                elif 'courses_not' in p:
                    is_cnw = True
                elif 'courses' in p:
                    is_courses = True
                prolog.assertz(p)
            user = list(prolog.query("user(X)"))[0]["X"]
            if not is_credits:
                prolog.assertz(f"credits_wanted({user},any)")
            if not is_cw:
                prolog.assertz(f"courses_wanted({user},[])")
            if not is_cnw:
                prolog.assertz(f"courses_not({user},[])")
            if not is_courses:
                prolog.assertz(f"courses({user},[])")
            schedule_dict = list(prolog.query(query))[0]
            print("cryptic response:",schedule_dict)
            humanized_result = humanize(schedule_dict)
        response += "\n"+humanized_result
        user_res = input(response)
        
        gpt_res = gpt_reply(user_res, running_predicates)


def humanize(solution):
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
def get_next_q(running_p):
    context = context_gpt_reply_2_ask_next_v2
    '''
    completion = client.chat.completions.create(
                model="gemma2-9b-it",
                #model="llama-3.1-70b-versatile",
                #model="gemma2-9b-it",
                messages=[
                    
                    {
                        "role": "user",
                        "content": context+"\nHere are the previous predicates that have been created" + str(running_p)
                    }
                ],
                temperature=0,
                max_tokens=1024,
                top_p=1,
                stream=True,
                stop=None,
                )
    answer = ""
    for chunk in completion:
                answer+=chunk.choices[0].delta.content or ""
    return answer
    '''
    response = client2.chat.completions.create(
    model="gpt-4o-mini-2024-07-18",
    messages=[
         {"role":"system",
          "content":context
          },
         {
         "role":"user",
         "content": "Here are the previous predicates that have been created" + str(running_p)
    }],
    temperature=0,
    max_tokens=256,
    top_p=1,
    frequency_penalty=0,
    presence_penalty=0
    )
    reply = response.choices[0].message.content
    return reply

def gpt_reply(inp,predicates):
    context = context_gpt_reply_2
    '''
    completion = client.chat.completions.create(
                #model="llama-3.1-70b-versatile",
                #model="gemma2-9b-it",
                #model = "mixtral-8x7b-32768",
                messages=[
                    
                    {
                        "role": "user",
                        "content": context+"\nBelow is the input from the user\n"+inp + "previous predicates to help you not create duplicate predicates" + str(predicates)
                    }
                ],
                temperature=0,
                max_tokens=1024,
                top_p=1,
                stream=True,
                stop=None,
                )
    answer = ""
    for chunk in completion:
                answer+=chunk.choices[0].delta.content or ""
    return answer
    '''
    
    response = client2.chat.completions.create(
    model="gpt-4o-mini-2024-07-18",
    messages=[
         {"role":"system",
          "content":context
          },
         {
         "role":"user",
         "content": "Below is the input from the user\n"+inp + "previous predicates to help you not create duplicates" + str(predicates)
    }],
    temperature=0,
    max_tokens=256,
    top_p=1,
    frequency_penalty=0,
    presence_penalty=0
    )
    reply = response.choices[0].message.content
    print(reply)
    return reply
    
    


def analyze_preds(preds):
    facts = []
    schedule_query = None
    answer = ""
    for pred in preds:
        if "require" in pred:
            plain  = pred.replace("require(","").replace(")","").replace("\n","")
            p_name,p_knowledge  = plain.split(":")
            predicate = p_name + "(" + p_knowledge + ")"
            facts.append(predicate)
        elif "create_schedule" in pred:
            schedule_query = "user(X),subjects(X,S),give_recs(X,S,R,Prereqs)"
        elif "query" in pred:
            answer +=  get_basic_query_response(pred) + "\n"
    return [facts,schedule_query,answer]

def get_basic_query_response(query):
    context = context_basic_query_response
    plain  = query.replace("query(","").replace(")","")
    p_name,p_knowledge  = plain.split(":")
    predicate = p_name + "(" + p_knowledge + ")"
    prolog2 = Prolog()
    prolog2.consult("knowledge_base.pl")
    print(predicate)
    answer = list(prolog2.query(predicate))
    print(answer)
    '''
    completion = client.chat.completions.create(
                model="llama-3.1-70b-versatile",
                #model="gemma2-9b-it",    
                messages=[
                    
                    {
                        "role": "user",
                        "content": context+"\nbelow is the query\n"+query + "\n below is the answer to the query\n"+ str(answer)
                    }
                ],
                temperature=1,
                max_tokens=1024,
                top_p=1,
                stream=True,
                stop=None,
                )
    answer = ""
    for chunk in completion:
                answer+=chunk.choices[0].delta.content or ""
    '''
    response = client2.chat.completions.create(
    model="gpt-4o-mini-2024-07-18",
    messages=[
         {"role":"system",
          "content":context
          },
         {
         "role":"user",
         "content": "\nBelow is the query\n"+query + "\n below is the answer to the query\n"+ str(answer)
    }],
    temperature=0,
    max_tokens=256,
    top_p=1,
    frequency_penalty=0,
    presence_penalty=0
    )
    reply = response.choices[0].message.content
    return reply


#print(gpt_reply(inp="I am very good at math.",predicates = ['require(user: akshay)','require(grade:akshay,11)']))
if __name__ == "__main__":
    main()       

