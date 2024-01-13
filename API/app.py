from flask import Flask, request, jsonify
from flask_pymongo import PyMongo
from bson import ObjectId

app = Flask(__name__)
app.config['MONGO_URI'] = 'mongodb://localhost:27017/notes'
mongo = PyMongo(app).db


@app.route('/get', methods=['GET'])
def get():
    if request.method=='GET':
        todo = []
        notes = mongo.details.find({})
        for note in notes:
            items = {
                'id': str(note['_id']),
                "title": note['title'],
                "d": note['desc']
            }
            todo.append(items)
        return todo


@app.route('/post', methods=['POST'])
def post_or_get():
    data = {}
    if request.method == 'POST':
        data['title'] = request.json['title']
        data['desc'] = request.json['desc']
        mongo.details.insert_one(data)
        return 'note successfully saved'

@app.route('/delete/<string:id>', methods=['DELETE'])
def delete(id):
    if request.method=='DELETE':
        mongoid= ObjectId(id)
        mongo.details.find_one_and_delete({'_id':mongoid})
        return 'note successfully deleted'


@app.route('/update_or_delete/<string:id>', methods=['PUT'])
def update_or_delete(id):
    noteid = ObjectId(id)
    if request.method == 'PUT':
        mongo.details.find_one_and_update({'_id': noteid}, {'$set': {'title': 'ANKITA'}})
        return 'note successfully updated'


@app.route('/get_by_id/<string:id>', methods=['GET'])
def get_by_id(id):
    mongoid = ObjectId(id)
    if request.method == 'GET':
        note = mongo.details.find_one({'_id': mongoid})
        if note is None:
            return jsonify("Not found", "Error")
        item = {
            'id': str(note['_id']),
            'title': note['title'],
            'desc': note['desc']
        }
        return item


if __name__ == "__main__":
    app.run(debug=True)