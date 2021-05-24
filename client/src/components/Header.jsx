import React from 'react';

import AccountCircleIcon from '@material-ui/icons/AccountCircle';
import SearchIcon from '@material-ui/icons/Search';
import { makeStyles, Paper, Tabs, Tab } from '@material-ui/core';

import { Link } from 'react-router-dom';

const useStyles = makeStyles({
  root: {
    flexGrow: 1,
    padding: 0,
  },
  tab: {
    minWidth: '50vw',
  },
});

const Header = () => {
  const classes = useStyles();
  const [value, setValue] = React.useState(0);

  const handleChange = (event, newValue) => {
    setValue(newValue);
  };
  return (
    <div className='App-header'>
      <Paper className={classes.root}>
        <Tabs
          value={value}
          onChange={handleChange}
          indicatorColor='primary'
          textColor='primary'
        >
          <Tab
            classes={{ root: classes.tab }}
            icon={<SearchIcon fontSize='large' />}
            aria-label='/'
            component={Link}
            to='/'
          />
          <Tab
            classes={{ root: classes.tab }}
            icon={<AccountCircleIcon fontSize='large' />}
            aria-label='/profile'
            component={Link}
            to='/profile'
          />
        </Tabs>
      </Paper>
    </div>
  );
};

export default Header;
