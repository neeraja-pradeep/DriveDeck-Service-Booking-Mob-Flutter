Integration Document - Driveto

The Figma design for this assignment can be found here:

Mobile App:- https://www.figma.com/design/qUbMBvSCJeD4cfPukaD0UU/Driveto--Car-wash----Nexotech?node-id=114-829&p=f&t=vfMhWHD3wt9P8Rmn-0
The screens provided in the Figma file show:
API Endpoints
All endpoints return JSON responses. Use REST GET calls to fetch and render the UI data. The base URL: http://156.67.104.149:8110/ and use the extension given below, test these endpoints in postman to get an idea on the response of each endpoints.

User IDs
Superadmin - 2


Headers -
 dev - {user_id}
If-Modified-Since - Sun, 26 Oct 2025 09:51:00 GMT

Note:- The timestamp mentioned here must be the timestamp fetched from the header of the responses.  

Screen : Profile
a) Display Profile
Swagger link: http://156.67.104.149:8110/api/docs/swagger/#/User%20Profile/user_profile_get
get endpoint: http://156.67.104.149:8110/api/accounts/profile/
Required Fields : username

b) Update Profile 

Swagger link: http://156.67.104.149:8110/api/docs/swagger/#/User%20Profile/user_profile_update
patch endpoint: http://156.67.104.149:8110/api/accounts/profile/
