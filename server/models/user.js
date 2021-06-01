const mongoose = require("mongoose");

const Schema = mongoose.Schema;

const bcrypt = require('bcrypt-nodejs');

const userSchema = new Schema({
    username: String,
    password: String,
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


// Hash user password
userSchema.methods.generateHash = function(password) {
    return bcrypt.hashSync(password, bcrypt.genSaltSync(8), null);
};

// Verify password
userSchema.methods.validPassword = function(password) {
    return bcrypt.compareSync(password, this.password);
};

const User = mongoose.model("User", userSchema);

module.exports = User;