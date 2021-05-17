import React from "react";

import AccountCircleIcon from "@material-ui/icons/AccountCircle";
import SearchIcon from "@material-ui/icons/Search";
import { makeStyles } from "@material-ui/core/styles";
import Paper from "@material-ui/core/Paper";
import Tabs from "@material-ui/core/Tabs";
import Tab from "@material-ui/core/Tab";

import { BrowserRouter as Router, Switch, Route, Link } from "react-router-dom";

import Search from "./Search";
import ProfilePage from "./ProfilePage";

const useStyles = makeStyles({
  root: {
    flexGrow: 1,
    padding: 0,
  },
  tab: {
    minWidth: "50vw",
  },
});

const Header = () => {
  const classes = useStyles();
  const [value, setValue] = React.useState(0);

  const handleChange = (event, newValue) => {
    setValue(newValue);
  };
  return (
    <Router>
      <div className="App-header">
        <Paper className={classes.root}>
          <Tabs
            value={value}
            onChange={handleChange}
            indicatorColor="primary"
            textColor="primary"
          >
            <Tab
              classes={{ root: classes.tab }}
              icon={<SearchIcon fontSize="large" />}
              aria-label="/"
              component={Link}
              to="/"
            />
            <Tab
              classes={{ root: classes.tab }}
              icon={<AccountCircleIcon fontSize="large" />}
              aria-label="/profile"
              component={Link}
              to="/profile"
            />
          </Tabs>
        </Paper>
      </div>
      <Switch>
        <Route exact path="/" component={Search} />
        <Route path="/profile" component={ProfilePage} />
      </Switch>
    </Router>
  );
};

export default Header;
