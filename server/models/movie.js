const mongoose = require('mongoose');

const Schema = mongoose.Schema;

const movieSchema = newSchema({
    id: { type: Number },
    title: { type: String },
    genres: { type: Array },
    overview: { type: String },
    runtime: {type: Number},
    vote_average: {type: Number},
    user_score: {type: Number},
})

const Movie = mongoose.model('Movie', movieSchema);

module.exports = User;