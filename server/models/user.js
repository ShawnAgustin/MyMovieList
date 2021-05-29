const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const userSchema = new Schema({
    username: String,
    planToWatch: [{
        id: Number,
        title: String,
        rating: Number,
        pp: String,
        overview: String,
        genres: [{
            id: Number,
            name: String,
            _id: false,
        }],
        runtime: Number,
        _id: false,
    }],
    completed: [{
        id: Number,
        title: String,
        rating: Number,
        userScore: Number,
        pp: String,
        overview: String,
        genres: [{
            id: Number,
            name: String,
            _id: false,
        }],
        runtime: Number,
        _id: false,
    }],
});

const User = mongoose.model("User", userSchema);

module.exports = User;