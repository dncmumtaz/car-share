import json

from flask import Flask, jsonify, request
from sqlalchemy import create_engine, MetaData, Table, Column, Integer, String

app = Flask(__name__)

HEROKU = False

db_uri = 'postgresql://cyutwuvltnmpqx:7229f3ebe308a11e0d2f55f329c7242333fe82a9d66568667b832002defbdd14@ec2-34-233-214-228.compute-1.amazonaws.com:5432/ddku14k3o8ma8p'
engine = create_engine(db_uri)
metadata = MetaData()

@app.route('/', methods=['GET', 'POST'])
def main():
    print(engine.table_names())
    users = Table('users', metadata, autoload=True, autoload_with=engine)
    engine.execute(users.insert(), name='deneme2', email='flask@tryinggg')

    if (request.method == 'GET'):
        data = {"data": "Hello World"}
        return jsonify(data)



#-------------------POST REQUESTS--------------------#

@app.route('/register', methods=['POST'])
def register():

    username = request.json['username']
    email = request.json['email']
    firstname = request.json['firstname']
    lastname = request.json['lastname']
    password = request.json['password']
    mobile = request.json['mobile']
    address = request.json['address']


    users = Table('users', metadata, autoload=True, autoload_with=engine)

    engine.execute(users.insert(), username=username, email=email,
                   firstname=firstname,lastname=lastname,
                   password=password,points=0,mobile=mobile,
                   address=address)


    return request.json

@app.route('/addUserInTrip', methods=['POST'])
def addUserInTrip():

    creator_id = request.json['creator_id']
    passenger_id = request.json['passenger_id']
    trip_id = request.json['trip_id']
    passenger_name = request.json['passenger_name']


    users_in_trip = Table('users_in_trip', metadata, autoload=True, autoload_with=engine)

    engine.execute(users_in_trip.insert(), creator_id=creator_id, passenger_id=passenger_id,
                   trip_id=trip_id, passenger_name=passenger_name)


    return request.json

@app.route('/newTrip', methods=['POST'])
def newTrip():
        startaddress = request.json['startaddress']
        endaddress = request.json['endaddress']
        point = request.json['point']
        user_id = request.json['user_id']
        date = request.json['date']
        time = request.json['time']

        startlat = request.json['startlat']
        startlong = request.json['startlong']

        endlat = request.json['endlat']
        endlong = request.json['endlong']

        nameSurname = request.json['namesurname']

        trips = Table('trips', metadata, autoload=True, autoload_with=engine)

        engine.execute(trips.insert(), startaddress=startaddress, endaddress=endaddress,
                       point=point, user_id=user_id,
                       date=date, time=time,
                       startlat=startlat, startlong=startlong,
                       endlat=endlat, endlong=endlong, namesurname=nameSurname )

        return jsonify(request.json)

@app.route('/tripRequest', methods=['POST'])
def tripRequest():

        sender_id = request.json['sender_id']
        getter_id = request.json['getter_id']
        namesurname = request.json['namesurname']
        trip_id = request.json['trip_id']
        location = request.json['location']

        strSender_id = '\''+str(sender_id)+'\''
        strGetter_id = '\''+str(getter_id)+'\''
        strTrip_id = '\''+str(trip_id)+'\''

        trip_requests = Table('trip_requests', metadata, autoload=True, autoload_with=engine)

        engine.execute(trip_requests.insert(), sender_id=sender_id, getter_id=getter_id,
                       namesurname=namesurname, trip_id=trip_id, location=location
                        )

        return jsonify(request.json)

@app.route('/tripsJoin', methods=['POST'])
def tripsJoin():

        sender_id = request.json['sender_id']
        getter_id = request.json['getter_id']
        namesurname = request.json['namesurname']
        startaddress = request.json['startaddress']
        endaddress = request.json['endaddress']
        trip_id = request.json['trip_id']
        point = request.json['point']
        date = request.json['date']
        time = request.json['time']

        strSender_id = '\''+str(sender_id)+'\''
        strGetter_id = '\''+str(getter_id)+'\''
        strTrip_id = '\''+str(trip_id)+'\''

        trip_joins = Table('trip_joins', metadata, autoload=True, autoload_with=engine)

        engine.execute(trip_joins.insert(), sender_id=sender_id, getter_id=getter_id,
                       namesurname=namesurname, trip_id=trip_id, startaddress=startaddress,
                       endaddress=endaddress, point=point, date=date, time=time
                      )

        return jsonify(request.json)


@app.route('/newBlocked', methods=['POST'])
def newBlocked():
        user_id = request.json['user_id']
        blocked_id = request.json['blocked_id']


        blocked_users = Table('blocked_users', metadata, autoload=True, autoload_with=engine)

        engine.execute(blocked_users.insert(), user_id=user_id, blocked_id=blocked_id)

        return jsonify(request.json)

@app.route('/newComment', methods=['POST'])
def newComment():
        user_id = request.json['user_id']
        comment = request.json['comment']
        commenter_id = request.json['commenter_id']

        comments = Table('comments', metadata, autoload=True, autoload_with=engine)

        engine.execute(comments.insert(), user_id=user_id, comment=comment, commenter_id=commenter_id)

        return jsonify(request.json)

@app.route('/newMessage', methods=['POST'])
def newMessage():
    sender_id = request.json['sender_id']
    target_id = request.json['target_id']
    message = request.json['message']
    time = request.json['time']

    user_messages = Table('user_messages', metadata, autoload=True, autoload_with=engine)

    engine.execute(user_messages.insert(), sender_id=sender_id, target_id=target_id, message=message, time=time)

    return jsonify(request.json)

@app.route('/newSavedTrip', methods=['POST'])
def newSavedTrip():
    start = request.json['start']
    endPoint = request.json['endPoint']
    points = request.json['points']
    user_id = request.json['user_id']

    saved_trips = Table('saved_trips', metadata, autoload=True, autoload_with=engine)

    engine.execute(saved_trips.insert(), start=start, endPoint=endPoint, points=points, user_id=user_id)

    return jsonify(request.json)

@app.route('/users_in_trip', methods=['POST'])
def users_in_trip():
    creator_id = request.json['creator_id']
    passenger_id = request.json['passenger_id']
    trip_id = request.json['trip_id']

    users_in_trip = Table('users_in_trip', metadata, autoload=True, autoload_with=engine)

    engine.execute(users_in_trip.insert(), creator_id=creator_id, passenger_id=passenger_id, trip_id=trip_id)

    return jsonify(request.json)


#------------------------GET REQUESTS------------------------#
@app.route('/getUserById', methods=['GET'])
def getUserById():

    id = request.args.get('id')
    strId = '\''+id+'\''


    users = Table('users', metadata, autoload=True, autoload_with=engine)
    result = engine.execute("SELECT * FROM users where id ="+strId)


    for item in result:

        jsontemp = {
            "id": item['id'],
            "username": item['username'],
            "email": item['email'],
            "firstname": item['firstname'],
            "lastname": item['lastname'],
            "password": item['password'],
            "address": item['address'],
            "points": item['points'],
            "mobile": item['mobile'],
        }

        return jsontemp


@app.route('/getTripRequestsId', methods=['GET'])
def getTripRequestsId():

    id = request.args.get('tripId')
    getterId = request.args.get('userId')
    strId = '\''+getterId+'\''
    strTripId = '\''+id+'\''


    trip_requests = Table('trip_requests', metadata, autoload=True, autoload_with=engine)
    result = engine.execute("SELECT * FROM trip_requests where getter_id ="+str(getterId)+"and trip_id = "+str(id))

    jsonArray = []

    for item in result:

        jsontemp = {
            "id": item['id'],
            "getter_id": item['getter_id'],
            "sender_id": item['sender_id'],
            "trip_id": item['trip_id'],
            "namesurname": item['namesurname'],
            "location": item['location'],
        }

        jsonArray.append(jsontemp)

    jsonGeneral = {"result": jsonArray}
    return jsonGeneral


@app.route('/login', methods=['GET'])
def login():

    username = request.args.get('username')
    email = request.args.get('email')
    password = request.args.get('password')

    strUser = '\''+username+'\''

    print(username)
    print(email)
    print(password)

    users = Table('users', metadata, autoload=True, autoload_with=engine)
    result = engine.execute("SELECT * FROM users where username ="+strUser)


    for item in result:

        jsontemp = {
            "id": item['id'],
            "username": item['username'],
            "email": item['email'],
            "firstname": item['firstname'],
            "lastname": item['lastname'],
            "password": item['password'],
            "address": item['address'],
            "points": item['points'],
            "mobile": item['mobile'],
        }

    if(password == jsontemp.get("password")):
        return jsontemp
    else:
        status_code = flask.Response(status=400)
        return jsonify(False)

@app.route('/emptyTables', methods=['DELETE'])
def emptyTables():


    trip_joins = Table('trip_joins', metadata, autoload=True, autoload_with=engine)
    engine.execute("DELETE FROM trip_joins")

    trip_requests = Table('trip_requests', metadata, autoload=True, autoload_with=engine)
    engine.execute("DELETE FROM trip_requests")

    trips = Table('trips', metadata, autoload=True, autoload_with=engine)
    engine.execute("DELETE FROM trips")

    users_in_trip = Table('users_in_trip', metadata, autoload=True, autoload_with=engine)
    engine.execute("DELETE FROM users_in_trip")

    return  "x"

@app.route('/deleteARequest', methods=['DELETE'])
def deleteARequest():

    reqId = request.args.get('reqId')

    trip_requests = Table('trip_requests', metadata, autoload=True, autoload_with=engine)
    engine.execute("DELETE FROM trip_requests WHERE id="+str(reqId))

    return  "x"

@app.route('/getUserInfo', methods=['GET'])
def getUserInfo():

    userId = request.args.get('userId')

    strUser = '\''+userId+'\''

    users = Table('users', metadata, autoload=True, autoload_with=engine)
    result = engine.execute("SELECT * FROM users where id ="+str(userId))

    jsonArray = []

    for item in result:

        jsontemp = {
            "id": item['id'],
            "username": item['username'],
            "email": item['email'],
            "firstname": item['firstname'],
            "lastname": item['lastname'],
            "password": item['password'],
            "address": item['address'],
            "points": item['points'],
            "mobile": item['mobile'],
        }
        jsonArray.append(jsontemp)

    jsonGeneral = {"result": jsonArray}
    return jsonGeneral



@app.route('/getUsersTrip', methods=['GET'])
def getUsersTrip():

    userId = request.args.get('userId')

    strUser = '\''+userId+'\''

    users = Table('trips', metadata, autoload=True, autoload_with=engine)
    result = engine.execute("SELECT * FROM trips where user_id ="+userId)

    jsonArray = []

    for item in result:

        jsontemp = {
            "id": item['id'],
            "point": item['point'],
            "user_id": item['user_id'],
            "date": item['date'],
            "time": item['time'],
            "startaddress": item['startaddress'],
            "startlat": item['startlat'],
            "startlong": item['startlong'],
            "endaddress": item['endaddress'],
            "endlat": item['endlat'],
            "endlong": item['endlong'],
            "namesurname": item['namesurname'],
        }
        jsonArray.append(jsontemp)

    jsonGeneral = {"result": jsonArray}
    return jsonGeneral

@app.route('/getUserRequests', methods=['GET'])
def getUserRequests():

    getterId = request.args.get('getterId')

    strGetterId = '\''+getterId+'\''

    users = Table('trips', metadata, autoload=True, autoload_with=engine)
    result = engine.execute("SELECT * FROM trips where getterId ="+getterId)

    jsonArray = []

    for item in result:

        jsontemp = {
            "id": item['id'],
            "point": item['point'],
            "user_id": item['user_id'],
            "date": item['date'],
            "time": item['time'],
            "startaddress": item['startaddress'],
            "startlat": item['startlat'],
            "startlong": item['startlong'],
            "endaddress": item['endaddress'],
            "endlat": item['endlat'],
            "endlong": item['endlong'],
            "namesurname": item['namesurname'],
        }
        jsonArray.append(jsontemp)

    jsonGeneral = {"result": jsonArray}
    return jsonGeneral

@app.route('/getSavedTrips', methods=['GET'])
def getSavedTrips(): # returns saved trips of a user by user id

    id = request.args.get('id')
    idStr = str(id)

    saved_trips = Table('saved_trips', metadata, autoload=True, autoload_with=engine)
    result = engine.execute("SELECT * FROM saved_trips where user_id ="+idStr)

    jsonArray = []


    for item in result:
  #      print('id: ', item['id'], ' start: ',item['start'], ' end: ',item['end'], ' points: ',item['points'] )

        jsontemp = {
            "id" : item['id'],
            "start" : item['start'],
            "endPoint": item['endPoint'],
            "points": item['points'],
        }
        jsonArray.append(jsontemp)

    jsonGeneral = {"result" : jsonArray}


#    print("x: ",(engine.execute(saved_trips.select()).keys()))


    return jsonGeneral

@app.route('/getBlockedUsers', methods=['GET'])
def getBlockedUsers(): # returns blocked users of a user by user id

    id = request.args.get('id')
    idStr = str(id)

    blocked_users = Table('blocked_users', metadata, autoload=True, autoload_with=engine)
    result = engine.execute("SELECT * FROM blocked_users where user_id ="+idStr)

    jsonArray = []

    for item in result:

        jsontemp = {
            "id" : item['id'],
            "user_id" : item['user_id'],
            "blocked_id": item['blocked_id'],
        }
        jsonArray.append(jsontemp)

    jsonGeneral = {"result" : jsonArray}
    return jsonGeneral

@app.route('/getComments', methods=['GET'])
def getComments(): # returns blocked users of a user by user id

    id = request.args.get('id')
    idStr = str(id)

    comments = Table('comments', metadata, autoload=True, autoload_with=engine)
    result = engine.execute("SELECT * FROM comments where user_id ="+idStr)

    jsonArray = []

    for item in result:

        jsontemp = {
            "id" : item['id'],
            "user_id" : item['user_id'],
            "comment": item['comment'],
            "commenter_id": item['commenter_id'],
        }
        jsonArray.append(jsontemp)

    jsonGeneral = {"result" : jsonArray}
    return jsonGeneral

@app.route('/getUsersInTrip', methods=['GET'])
def getUsersInTrip(): # returns blocked users of a user by user id

    id = request.args.get('id')
    idStr = '\'' + str(id) + '\''

    users_in_trip = Table('users_in_trip', metadata, autoload=True, autoload_with=engine)
    result = engine.execute("SELECT * FROM users_in_trip where trip_id ="+str(id))

    jsonArray = []

    for item in result:

        jsontemp = {
            "id" : item['id'],
            "creator_id" : item['creator_id'],
            "passenger_id": item['passenger_id'],
            "trip_id": item['trip_id'],
            "passenger_name": item['passenger_name']
        }
        jsonArray.append(jsontemp)

    jsonGeneral = {"result" : jsonArray}
    return jsonGeneral

@app.route('/getUsersInAllTripsOfUser', methods=['GET'])
def getUsersInAllTripsOfUser(): # returns blocked users of a user by user id

    userId = request.args.get('userId')

    strUser = '\''+userId+'\''

    users = Table('trips', metadata, autoload=True, autoload_with=engine)
    result = engine.execute("SELECT * FROM trips where user_id ="+userId)

    jsonArray = []

    for item in result:

        jsontemp = {
            "id": item['id'],
            "point": item['point'],
            "user_id": item['user_id'],
            "date": item['date'],
            "time": item['time'],
            "startaddress": item['startaddress'],
            "startlat": item['startlat'],
            "startlong": item['startlong'],
            "endaddress": item['endaddress'],
            "endlat": item['endlat'],
            "endlong": item['endlong'],
            "namesurname": item['namesurname'],
            "notf": item['notf'],
        }

        jsonArray.append(jsontemp)

    jsonGeneral = {"result": jsonArray}


    totalArray = []

    for item in jsonArray:

        users_in_trip = engine.execute("SELECT * FROM users_in_trip where trip_id =" + str(item['id']))

        userArr = []

        for uitem in users_in_trip:
            jsonUsers = {
                'id': uitem['id'],
                'creator_id': uitem['creator_id'],
                'passenger_id': uitem['passenger_id'],
                'trip_id': uitem['trip_id'],
                'passenger_name': uitem['passenger_name'],
                'payment' : uitem['payment']

            }
            userArr.append(jsonUsers)

        jsonTemproary = {
            "trip" : item,
            "users" : userArr
        }

        print()
        totalArray.append(jsonTemproary)


    jsonTotal = {"result" : totalArray}


    return jsonTotal

"""
        users_in_trip = Table('users_in_trip', metadata, autoload=True, autoload_with=engine)
        userResult = engine.execute("SELECT * FROM users_in_trip where creator_id =" + idStr)

        userArray = []

        for itemUser in userResult:
            tempUser = {
                "id": itemUser['id'],
                "creator_id": itemUser['creator_id'],
                "passenger_id": itemUser['passenger_id'],
                "trip_id": itemUser['trip_id'],
                "passenger_name": itemUser['passenger_name']
            }
            userArray.append(tempUser)
"""







"""
    id = request.args.get('id')
    idStr = '\'' + str(id) + '\''

    users_in_trip = Table('users_in_trip', metadata, autoload=True, autoload_with=engine)
    result = engine.execute("SELECT * FROM users_in_trip where creator_id ="+idStr)

    jsonArray = []

    for item in result:

        jsontemp = {
            "id" : item['id'],
            "creator_id" : item['creator_id'],
            "passenger_id": item['passenger_id'],
            "trip_id": item['trip_id'],
            "passenger_name": item['passenger_name']
        }
        jsonArray.append(jsontemp)

    jsonGeneral = {"result" : jsonArray}
    return jsonGeneral

"""
@app.route('/getMessages', methods=['GET'])
def getMessages(): # returns blocked users of a user by user id

    id = request.args.get('id')
    idStr = str(id)

    user_messages = Table('user_messages', metadata, autoload=True, autoload_with=engine)
    result = engine.execute("SELECT * FROM user_messages where sender_id ="+idStr)

    jsonArray = []

    for item in result:

        jsontemp = {
            "id" : item['id'],
            "sender_id" : item['sender_id'],
            "target_id": item['target_id'],
            "message": item['message'],
            "time": item['time'],
        }
        jsonArray.append(jsontemp)

    jsonGeneral = {"result" : jsonArray}
    return jsonGeneral

@app.route('/getJoinedTrips', methods=['GET'])
def getJoinedTrips(): # returns blocked users of a user by user id

    user_id = request.args.get('user_id')

    strUser_id = '\''+user_id+'\''
    trip_joins = Table('trip_joins', metadata, autoload=True, autoload_with=engine)

    result = engine.execute("SELECT * FROM trip_joins where \"sender_id\" = "+strUser_id)

    jsonArray = []

    for item in result:

        jsontemp = {
            "sender_id" : item['sender_id'],
            "trip_id" : item['trip_id'],
            "startaddress": item['startaddress'],
            "endaddress": item['endaddress'],
            "getter_id": item['getter_id'],
            "id": item['id'],
            "point": item['point'],
            "namesurname": item['namesurname'],
            "situation": item['situation'],
            "date": item['date'],
            "time": item['time']
        }

        jsonArray.append(jsontemp)

    jsonGeneral = {"result" : jsonArray}
    return jsonGeneral


@app.route('/getUserPoints', methods=['GET'])
def getUserPoints(): # returns blocked users of a user by user id

    user_id = request.args.get('user_id')

    users = Table('users', metadata, autoload=True, autoload_with=engine)

    result = engine.execute("SELECT * FROM users where id = "+str(user_id))



    for item in result:
        jsonGeneral = {"result": item['points']}


    return jsonGeneral


@app.route('/getRelatedTrips', methods=['GET'])
def getRelatedTrips(): # returns blocked users of a user by user id

    startlat = request.args.get('startlat')
    startlong = request.args.get('startlong')
    endlat = request.args.get('endlat')
    endlong = request.args.get('endlong')
    date = request.args.get('date')

  # date = request.args.get('date')

    idStr = str(id)

    """
    strStart = '\''+start+'\''
    strEnd = '\''+endPoint+'\''
    """
    strDate = '\''+date+'\''
    trips = Table('trips', metadata, autoload=True, autoload_with=engine)

    result = engine.execute("SELECT * FROM trips where \"date\" = "+strDate)

#    result = engine.execute("SELECT * FROM trips where \"start\" = "+strStart+" and \"endPoint\" = "+strEnd+" and \"date\" = "+strDate)

    jsonArray = []

    for item in result:

        jsontemp = {
            "id" : item['id'],
            "startaddress" : item['startaddress'],
            "startlat": item['startlat'],
            "startlong": item['startlong'],
            "endaddress": item['endaddress'],
            "endlat": item['endlat'],
            "endlong": item['endlong'],
            "point": item['point'],
            "user_id": item['user_id'],
            "date": item['date'],
            "time": item['time'],
            "namesurname" : item['namesurname']
        }

        jsonArray.append(jsontemp)

    jsonGeneral = {"result" : jsonArray}
    return jsonGeneral



############---------- UPDATE Requests ----------############

@app.route('/rejectRequest', methods=['PUT'])
def rejectRequest():
    tripId = request.args.get('tripId')
    userId = request.args.get('userId')
    trip_joins = Table('trip_joins', metadata, autoload=True, autoload_with=engine)

    strTripId = '\''+tripId+'\''
    strUserId = '\''+userId+'\''

    result = engine.execute("UPDATE  trip_joins SET situation=\'Rejected\' where trip_id = "+strTripId+"and sender_id="+strUserId)

    trip_requests = Table('trip_requests', metadata, autoload=True, autoload_with=engine)

    result2 = engine.execute("DELETE FROM trip_requests WHERE trip_id="+strTripId+"AND getter_id="+strUserId)


    return 'x'


@app.route('/setNotfTrue', methods=['PUT'])
def setNotfTrue():
    tripId = request.args.get('tripId')

    trips = Table('trips', metadata, autoload=True, autoload_with=engine)


    result = engine.execute("UPDATE trips SET notf=\'true\' where id = "+str(tripId))

    return 'x'

@app.route('/setNotfFalse', methods=['PUT'])
def setNotfFalse():
    tripId = request.args.get('tripId')

    trips = Table('trips', metadata, autoload=True, autoload_with=engine)


    result = engine.execute("UPDATE trips SET notf=\'false\' where id = "+str(tripId))

    return 'x'

@app.route('/paymentActiveRequest', methods=['PUT'])
def paymentActiveRequest():
    tripId = request.args.get('tripId')
    userId = request.args.get('userId')
    users_in_trip = Table('users_in_trip', metadata, autoload=True, autoload_with=engine)

    strTripId = '\'' + tripId + '\''
    strUserId = '\'' + userId + '\''

    result = engine.execute(
        "UPDATE  users_in_trip SET payment=\'Done\' where trip_id = " + str(tripId) + " and passenger_id=" + str(userId))


    return 'x'

@app.route('/paymentUserCanceled', methods=['PUT'])
def paymentUserCanceled():
    tripId = request.args.get('tripId')
    userId = request.args.get('userId')
    users_in_trip = Table('users_in_trip', metadata, autoload=True, autoload_with=engine)

    strTripId = '\'' + tripId + '\''
    strUserId = '\'' + userId + '\''

    result = engine.execute(
        "UPDATE  users_in_trip SET payment=\'Request Canceled\' where trip_id = " + str(tripId) + " and passenger_id=" + str(userId))


    return 'x'


@app.route('/tripPostPoned', methods=['PUT'])
def tripPostPoned():
    tripId = request.args.get('tripId')
    date = request.args.get('date')
    datePost =  date+' (postponed)'

    strDate = '\'' + date + '\''

    strDatePost = '\'' + datePost + '\''
    strTripId = '\'' + tripId + '\''

    trip_joins = Table('trip_joins', metadata, autoload=True, autoload_with=engine)

    result = engine.execute(
        "UPDATE  trip_joins SET date="+ strDatePost + " where trip_id = " + strTripId )

    trips = Table('trips', metadata, autoload=True, autoload_with=engine)

    result = engine.execute(
        "UPDATE  trips SET date="+ strDate + " where id = " + str(tripId) )

    return 'x'


@app.route('/makePayment', methods=['PUT'])
def makePayment():
    userId = request.args.get('userId')
    points = request.args.get('points')

    users = Table('users', metadata, autoload=True, autoload_with=engine)

    result = engine.execute("UPDATE  users SET points="+ str(points) + " where id = "+str(userId))



    return 'x'


@app.route('/cancelTrip', methods=['DELETE'])
def cancelTrip():
    tripId = request.args.get('tripId')
    trips = Table('trips', metadata, autoload=True, autoload_with=engine)


    result = engine.execute("DELETE FROM trips WHERE id="+str(tripId))


    return 'x'

@app.route('/cancelDeleteTripFromRequests', methods=['DELETE'])
def cancelDeleteTripFromRequests():
    tripId = request.args.get('tripId')
    senderId = request.args.get('senderId')

    trip_requests = Table('trip_requests', metadata, autoload=True, autoload_with=engine)


    result = engine.execute("DELETE FROM trip_requests WHERE trip_id="+str(tripId)+" and sender_id="+str(senderId))



    return 'x'

@app.route('/cancelJoinedTrip', methods=['DELETE'])
def cancelJoinedTrip():
    tripId = request.args.get('tripId')
    trip_joins = Table('trip_joins', metadata, autoload=True, autoload_with=engine)
    strTripId = '\''+str(tripId)+'\''

    result = engine.execute("DELETE FROM trip_joins WHERE trip_id="+strTripId)


    return 'x'
@app.route('/approveRequest', methods=['PUT'])
def approveRequest():
    tripId = request.args.get('tripId')
    userId = request.args.get('userId')
    trip_joins = Table('trip_joins', metadata, autoload=True, autoload_with=engine)

    strTripId = '\''+tripId+'\''
    strUserId = '\''+userId+'\''

    result = engine.execute("UPDATE  trip_joins SET situation=\'Approved\' where trip_id = "+strTripId+"and sender_id="+strUserId)

    return 'x'

@app.route('/paymentDoneRequest', methods=['PUT'])
def paymentDoneRequest():
    tripId = request.args.get('tripId')
    userId = request.args.get('userId')
    trip_joins = Table('trip_joins', metadata, autoload=True, autoload_with=engine)

    strTripId = '\''+tripId+'\''
    strUserId = '\''+userId+'\''

    result = engine.execute("UPDATE  trip_joins SET situation=\'Payment Done\' where trip_id = "+strTripId+"and sender_id="+strUserId)

    return 'x'
@app.route('/tripCanceled', methods=['PUT'])
def tripCanceled():
    tripId = request.args.get('tripId')

    trip_joins = Table('trip_joins', metadata, autoload=True, autoload_with=engine)

    strTripId = '\''+tripId+'\''

    result = engine.execute("UPDATE  trip_joins SET situation=\'Trip Canceled\' where trip_id = "+strTripId)

    return 'x'


if __name__ == '__main__':
    if(not HEROKU):
        app.run(debug=True)
    else:
        app.run()
        
