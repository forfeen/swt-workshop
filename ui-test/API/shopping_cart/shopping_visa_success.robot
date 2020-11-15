***Settings***
Library    RequestsLibrary
Suite Setup    Create Session    alias=shopping    url=https://www.dminer.in.th

***Variables***
&{headers}    Content-Type=application/json    Accept=application/json

***Test Cases***
Test that user ซื้อของเล่นให้ลูกสาว เลือกวิธีการจัดส่งเป็น kerry และชำระเงินด้วยบัตรเครดิต visa และชำระเงินสำเร็จ
    Search
    Product Detail
    Submit Order
    # Confirm Payment

***Keywords***
Search
    ${resp}=    Get Request    alias=shopping    uri=/api/v1/product
    Request Should Be Successful    ${resp}
    Should Be Equal    ${resp.json()['products'][1]['product_name']}    43 Piece dinner Set
    Should Be Equal As Numbers    ${resp.json()['products'][1]['product_price']}    12.95
    Should Be Equal    ${resp.json()['products'][1]['product_image']}    /43_Piece_dinner_Set.png

Product Detail
    ${resp}=    Get Request    alias=shopping    uri=/api/v1/product/2    headers=&{headers}
    Request Should Be Successful    ${resp}

Submit Order
    ${data}=    To Json    { "cart" : [{ "product_id": 2,"quantity": 1}],"shipping_method" : "Kerry","shipping_address" : "405/37 ถ.มหิดล","shipping_sub_district" : "ต.ท่าศาลา","shipping_district" : "อ.เมือง","shipping_province" : "จ.เชียงใหม่","shipping_zip_code" : "50000","recipient_name" : "ณัฐญา ชุติบุตร","recipient_phone_number" : "0970809292"}
    ${resp}=    Post Request    alias=shopping    uri=/api/v1/order    headers=${headers}    json=${data}
    Request Should Be Successful    ${resp}
    Should Be Equal As Integers    ${resp.json()['order_id']}    8004359122
    Should Be Equal As Numbers    ${resp.json()['total_price']}    14.95
    ${order_id}=    Set Variable    ${resp.json()['order_id']}




