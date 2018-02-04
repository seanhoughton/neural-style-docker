FROM gcr.io/tensorflow/tensorflow
RUN apt-get -qy update && apt-get install -qy unzip
COPY neural-style.zip /tmp/neural-style.zip
RUN unzip -d / /tmp/neural-style.zip && rm /tmp/neural-style.zip
COPY imagenet-vgg-verydeep-19.mat /neural-style-master/imagenet-vgg-verydeep-19.mat
#RUN pip install -r /neural-style-master/requirements.txt
RUN pip install PIP
COPY neural_style.py /neural-style-master/neural_style_dev.py
WORKDIR /neural-style-master
ENTRYPOINT ["python", "/neural-style-master/neural_style_dev.py"]