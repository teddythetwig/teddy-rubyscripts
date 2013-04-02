require '../lib/FaceRecognition'

client = FaceRecognition.new("ugysi1yuaxitahxhloliynq0jrcqu5", "qmfisinh7xywzzw67wedcajegfwaa7")

response = client.createAlbum("familyteddythetwig")

puts response.to_s
