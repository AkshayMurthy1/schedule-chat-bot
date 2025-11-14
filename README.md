# Schedule Chatbot

A lightweight rule-based chatbot that generates student course schedules aligned with the Frisco ISD Course Catalog. It uses a Prolog knowledge base together with a Python chatbot interface to ensure schedules follow prerequisites, credits, endorsement pathways, and proper sequencing.

This repository includes multiple chatbot versions. Early prototypes were tested using Groq, but the newest and most reliable version uses OpenAI (dynamic_chatbot.py).

## Features

- Creates schedules that follow the Frisco ISD Course Catalog  
- Logic-driven reasoning using Prolog  
- Natural conversational interface powered by Python and OpenAI  
- Groq-based prototypes included for comparison  

## Dependencies

Install all dependencies below:

- pyswip — Python to Prolog integration  
- openai — Used by the latest chatbot  
- python-dotenv — Environment variable management  
- fastapi or flask (if included)  
- groq — For older experimental versions  
- logging, json, pathlib, and other standard utilities  
- SWI-Prolog — Required to run the Prolog knowledge base  

## Repository Structure

- dynamic_chatbot.py — Latest and recommended chatbot version (OpenAI)  
- chatbot_groq*.py — Early prototypes using Groq  
- *.pl — Prolog rules defining prerequisites, credits, endorsements, and course logic  
- Backend utilities — Handle query routing and conversation flow  

## Running the Chatbot

1. Install dependencies  
2. Add your OpenAI API key to your environment  
3. Run the chatbot:

```bash
python dynamic_chatbot.py
```

## Notes

- The OpenAI version provides the strongest reasoning and conversational accuracy. 
- This project aims to show the power of Explainable AI And Logic-Based Systems in enforcing the accuracy of LLM's in conversation.
- All schedules generated strictly follow the Frisco ISD Course Catalog.

## License

MIT License.
