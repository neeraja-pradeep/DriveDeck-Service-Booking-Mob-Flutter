Integration Document - Driveto

The Figma design for this assignment can be found here:

Mobile App:- https://www.figma.com/design/qUbMBvSCJeD4cfPukaD0UU/Driveto--Car-wash----Nexotech?node-id=114-829&p=f&t=vfMhWHD3wt9P8Rmn-0
The screens provided in the Figma file show:
API Endpoints
All endpoints are non-authenticated and return JSON responses. Use REST GET calls to fetch and render the UI data. The base URL: http://156.67.104.149:8110/ and use the extension given below, test these endpoints in postman to get an idea on the response of each endpoints.

User IDs
Superadmin - 2


Headers -
 dev - {user_id}
If-Modified-Since - Sun, 26 Oct 2025 09:51:00 GMT

Note:- The timestamp mentioned here must be the timestamp fetched from the header of the responses.  

Signin / Login with OTP
Screen : Signin
a) Enter phone number
Swagger Endpoint:
http://156.67.104.149:8110/api/docs/swagger/#/Authentication/otp_login

POST endpoint: http://156.67.104.149:8110/api/accounts/send-otp/
Payload:
{
phone:"1234567890"
}
Required field: phone

b) Enter otp code

Swagger endpoint: http://156.67.104.149:8110/api/docs/swagger/#/Authentication/verify_otp_login
Post endpoint: http://156.67.104.149:8110/api/accounts/verify-otp/
Payload:
{
  "phone": "9876543210",
  "otp_code": "123456",
  "new_password": "newsecurepassword"
}

Required fields : phone, otp_code , new_password[if its password reset]

Signup
Screen : Register 
Register 
Swagger Endpoint: http://156.67.104.149:8110/api/docs/swagger/#/Authentication/auth_register
POST endpoint: http://156.67.104.149:8110/api/accounts/register/
payload:
{
  "phone": "1234567890",
  "username": "newuser",
  "password": "securepassword123",
  "password_confirm": "securepassword123"
}
Required Field : phone, username, password, password_confirm 


