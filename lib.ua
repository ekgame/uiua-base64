Alphabet ↚ "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/="

# Check if a string is a valid base64 string.
IsValidEncoding ↚ ¬∊1=⧻Alphabet⊗:Alphabet

# Decode a base64 string into a byte array.
InternalDecode ↚ (
  ⍤ ⊙IsValidEncoding "The string for Base64 decoding has invalid characters." .
  # Remove padding
  ▽≠@=.
  # Decode characters into arrays of 6 bits
  ≡(⬚0↯¤6)⋯⊗:Alphabet
  # Convert arrays of 6 bits into arrays of 8 bits
  ↯∞_8 ≡⇌
  # Convert arrays of bits into bytes
  ♭≡(°⋯⇌)
)

InternalEncode ↚ (
  ⍤ $"Invalid shape for Base64 encoding, expecting a [n] array, got _." : =1⧻.△.
  ⍤ "Invalid array for Base64 encoding, expecting a byte array, but the array has numbers higher than 255." ¬/↥>255.
  ⍤ "Invalid array for Base64 encoding, expecting a byte array, but the array has negative numbers." ¬/↥<0.
  # Convert bytes into arrays of 8 bits
  ≡(⇌⬚0↯¤8)⋯
  # Calculate the amount of padding
  ⟜(◿3-:3◿3⧻)
  # Convert arrays of 8 bits into arrays of 6 bits
  ≡⇌⬚0↯∞_6
  # Convert into characters
  ⊏:Alphabet°⋯
  # Add padding
  ⍥(⊂:@=):
)

# Decode a base64 string into a byte array
Decode ← setinv(InternalDecode|InternalEncode)

# Encode a byte array into a base64 string
Encode ← setinv(InternalEncode|InternalDecode)

# Decode a base64 string into a string
DecodeString ← °utf Decode

# Encode a string into a base64 string
EncodeString ← Encode utf

---
TestConsistency ← ⍤⟜≍ Decode Encode .
TestConsistency ⇡256

TestStringConsistency ← ⍤⟜≍ DecodeString EncodeString .
TestStringConsistency "Bonjour, c'est la vie!"
TestStringConsistency "Привет, как дела?"
TestStringConsistency "你好，世界"
TestStringConsistency "¡Hola, cómo estás?"
TestStringConsistency "안녕하세요, 여러분!"
TestStringConsistency "Ciao, come stai?"
TestStringConsistency "مرحبا، كيف حالك؟"
TestStringConsistency "Hej, hur mår du?"
TestStringConsistency "Merhaba, nasılsın?"
---
