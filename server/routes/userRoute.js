const router = require("express").Router();
let User = require("../models/user");

router.route('/').get((req, res) => {
    User.find()
        .then((users) => res.json(users))
        .catch((err) => res.status(400).json("Error: " + err));
});

router.route('/:id').get((req, res) => {
    User.findById(req.params.id)
        .then((user) => res.json(user))
        .catch((err) => res.status(400).json("Error: " + err));
});

router.route('/register').post((req, res) => {
    const username = req.body.username;
    const planToWatch = req.body.planToWatch

    const newUser = new User({ username, planToWatch });

    newUser.password = newUser.generateHash(req.body.password);

    User.findOne({ username: req.body.username })
        .then(console.log('user already registered!'))
        .catch(newUser.save()
            .then(() => res.json('User added!'))
            .then(() => console.log(`${req.body.username} now registered!`))
            .catch(err => res.status(400).json('Error: ' + err)));


});

router.route('/login').post((req, res) => {
    User.findOne({ username: req.body.username }, function(err, user) {

        if (!user.validPassword(req.body.password)) {
            //password did not match
            console.log('incorrect password');
        } else {
            // password matched. proceed forward
            console.log('logging in...');
        }
    }).catch(err => res.status(400).json('Error: ' + err));
});

module.exports = router;