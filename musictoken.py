import datetime
import jwt


secret = """-----BEGIN PRIVATE KEY-----
MIGTAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBHkwdwIBAQQgL6LBC9n3CJxcsqB4
t4Lu0GIRRGC2J+UEsHciAMrN9mqgCgYIKoZIzj0DAQehRANCAAQ6wDht2kDLClBQ
VOXj6Zkucr1Dz7HtM0F20HcnwZ+jmtZHVtS4lYCIur2enSQ8QhaIW0pZTXBgqhWm
ycAH0aHT
-----END PRIVATE KEY-----"""
keyId = "WJTYA6L933"
teamId = "Z3259GLB4X"
alg = 'ES256'

time_now = datetime.datetime.now()
time_expired = datetime.datetime.now() + datetime.timedelta(hours=4380)

headers = {
	"alg": alg,
	"kid": keyId
}

payload = {
	"iss": teamId,
	"exp": int(time_expired.strftime("%s")),
	"iat": int(time_now.strftime("%s"))
}


if __name__ == "__main__":
	"""Create an auth token"""
	token = jwt.encode(payload, secret, algorithm=alg, headers=headers)

	print ("----TOKEN----")
	print (token)

	print ("----CURL----")
	print ("curl -v -H 'Authorization: Bearer %s' \"https://api.music.apple.com/v1/catalog/us/artists/36954\" " % (token))

