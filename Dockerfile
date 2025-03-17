#take base image which should be light weight always this is first step
FROM python:3.4-alpine
#copy code to the above pythone image 
# first create a folder which will work as a present working directory , if the folder is not there it will create it.
WORKDIR /app
# bring application , dependencies to this application/app folder , here dependencies is flack
#COPY FIRST DOT WILL TAKE everyfiles from local (app.py,docker-compose ete)and copy it to the app folder
#COPY . .
#as per my requirment need only app.py and requirment.txt to move to app folder using following code
COPY requirements.txt .
COPY app.py .
#install dependencies which need to runn app.py here we have flask if multiple dependencies do according 
#To simplify the instalation of the module  of python app.py we keep all the dependencies in requrement.txt
RUN pip3 install -r requirements.txt
#python application run on 5000 port hence we have to expose the port(app.py will run on 5000 port)
EXPOSE 5000
#post packaging we need to run the applciation for that we use CMD - when we run container 
CMD [ "python3","app.py" ]