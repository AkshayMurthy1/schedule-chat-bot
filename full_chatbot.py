from groq import Groq
import os
os.environ['SWI_HOME_DIR'] = r'C:\Program Files\swipl'  # Adjust path as needed
os.environ['PATH'] += os.pathsep + r'C:\Program Files\swipl\bin'
from pyswip import Prolog
from prompt import *
from openai import OpenAI
client2 = OpenAI(api_key='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')


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
    convo_log = []
    response = "Type to start a chat going --> "
    user_res = input(response)
    gpt_res = gpt_reply(user_res,convo_log)
    #require();require();"this is the response back"
    while "done" not in gpt_res:
        schedule_gen=""
        high_preds = gpt_res.split(";")
        print(high_preds)
        response = high_preds.pop()
        facts,sched_query,answer_to_query = analyze_preds(high_preds)
        predicates.append(facts)

        if sched_query:
            for fact in facts:
                prolog.assertz(fact)
            #print("%%%CONVO LOG:\n",convo_log)
            solution = list(prolog.query(sched_query))[0]
            print(solution)
            schedule_gen = humanize(solution,convo_log)
            for fact in facts:
                prolog.retract(fact)

        convo_log.append({"user input":user_res,"your response":gpt_res+"\n"+schedule_gen})
        user_res = input(answer_to_query+ "\n"+schedule_gen+"\n"+response + "\n"+"Type here --> ")
        gpt_res = gpt_reply(user_res,convo_log)


def humanize(solution,log):
    context = context_reply_back  
    response = client2.chat.completions.create(
    model="gpt-4o-mini-2024-07-18",
    messages=[
         {"role":"system",
          "content":context
          },
         {
         "role":"user",
         "content": "Below is the schedule to give to the user\n"+str(solution) + "previous convo log (dont have to use this)" + str(log)
    }],
    temperature=.2,
    max_tokens=150,
    top_p=1,
    frequency_penalty=0,
    presence_penalty=0
    )
    reply = response.choices[0].message.content
    return reply


def gpt_reply(inp,log):
    context = full_context  
    response = client2.chat.completions.create(
    model="gpt-4o-mini-2024-07-18",
    messages=[
         {"role":"system",
          "content":context
          },
         {
         "role":"user",
         "content": "Below is the input from the user\n"+inp + "previous convo log" + str(log)
    }],
    temperature=.2,
    max_tokens=256,
    top_p=1,
    frequency_penalty=0,
    presence_penalty=0
    )
    reply = response.choices[0].message.content
    return reply
    
    


def analyze_preds(preds):
    facts = []
    schedule_query = None
    answer = ""
    for pred in preds:
        if "require" in pred:
            plain  = pred.replace("require(","").replace(")","")
            p_name,p_knowledge  = plain.split(":")
            predicate = p_name + "(" + p_knowledge + ")"
            facts.append(predicate)
        elif "create_schedule" in pred:
            schedule_query = "user(X),subjects(X,S),give_recs(X,S,R,Prereqs)"
        elif "query" in pred:
            #print("THERE IS A QUERY")
            answer +=  get_basic_query_response(pred) + "\n"
    return [facts,schedule_query,answer]

def get_basic_query_response(query):
    context = context_basic_query_response
    plain  = query.replace("query(","").replace(")","")
    p_name,p_knowledge  = plain.split(":")
    predicate = p_name + "(" + p_knowledge + ")"
    prolog2 = Prolog()
    prolog2.consult("knowledge_base.pl")
    #print(predicate)
    answer = list(prolog2.query(predicate))

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

