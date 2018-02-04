.PHONY: image

default: image

neural-style.zip:
	curl -q https://github.com/anishathalye/neural-style/archive/master.zip -L -o $@

imagenet-vgg-verydeep-19.mat:
	curl -q http://www.vlfeat.org/matconvnet/models/beta16/imagenet-vgg-verydeep-19.mat -L -o $@


image: neural-style.zip imagenet-vgg-verydeep-19.mat
	docker build -t neural-style .


test: image
	docker run --rm -ti -v $(CURDIR)/../neural-style/examples:/images neural-style \
		--content /images/2-content.jpg \
		--styles /images/2-style1.jpg \
		--output /images/2-output-sean.jpg \
		--checkpoint-output "/images/_checkpoint%s.jpg" \
		--checkpoint-iterations 20 \
		--iterations 200