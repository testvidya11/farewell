import sys

key = "i hope in the next ten years there would be no other farewell letter brilliant than this one"

def decrypt(content):
    encrypted = content.split(",")
    decrypted = "".join([chr(int(encrypted[i]) ^ ord(key[i % len(key)])) for i in range(len(encrypted))])
    return decrypted

with open(sys.argv[1], "r") as f:
    print decrypt(f.read()),
