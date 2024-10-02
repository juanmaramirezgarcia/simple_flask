FROM registry.access.redhat.com/ubi8/python-39  

# Set working directory first
WORKDIR /app

# Add application sources with correct permissions for OpenShift
USER 0  
ADD . . 
RUN chown -R 1001:0 /app  
USER 1001  

# Copy and install requirements
COPY ./requirements.txt . 
RUN pip3 install -r requirements.txt  

# Expose Flask port
EXPOSE 5000  

CMD python app.py runserver 0.0.0.0:5000