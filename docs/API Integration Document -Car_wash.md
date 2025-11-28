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

Screen : Shop page
a) Shop details
Swagger link: http://156.67.104.149:8110/api/docs/swagger/#/shop/shop_shops_retrieve
Get endpoint: http://156.67.104.149:8110/api/shop/shops/{id}/
Required Field : normal1_image_url, normal2_image_url, normal3_image_url, normal4_image_url, name, latitude, longitude, description 

b) Services

Swagger link: http://156.67.104.149:8110/api/docs/swagger/#/shop/shop_shop_services_list
Get endpoint: http://156.67.104.149:8110/api/shop/shop-services/
Query Params : shop [eg: ?shop=1]

Required fields : name, duration_in_slots, price

Screen : Time
a) Availability 
swagger link: http://156.67.104.149:8110/api/docs/swagger/#/shop/shop_schedule
Get endpoint: http://156.67.104.149:8110/api/shop/shops/{id}/date-day/

