import React, { useState, useEffect } from 'react';

import { makeStyles } from '@material-ui/core/styles';
import Accordion from '@material-ui/core/Accordion';
import AccordionSummary from '@material-ui/core/AccordionSummary';
import AccordionDetails from '@material-ui/core/AccordionDetails';
import Typography from '@material-ui/core/Typography';
import ExpandMoreIcon from '@material-ui/icons/ExpandMore';

import MiniMovie from '../assets/MiniMovie';

const useStyles = makeStyles((theme) => ({
  root: {
    width: '70%',
    margin: 'auto',
    padding: 10,
  },
  heading: {
    fontSize: theme.typography.pxToRem(20),
    fontWeight: theme.typography.fontWeightBold,
  },
}));

const ProfilePage = () => {
  const classes = useStyles();

  const [list, setList] = useState([]);

  useEffect(() => {
    for (let i = 0; i < localStorage.length; i += 1) {
      console.log(
        localStorage.key(i),
        localStorage.getItem(localStorage.key(i))
      );
    }
  }, []);

  return (
    <>
      <h1>My Profile</h1>
      <div className={classes.root}>
        <Accordion>
          <AccordionSummary
            expandIcon={<ExpandMoreIcon />}
            aria-controls='panel1a-content'
            id='panel1a-header'
          >
            <Typography className={classes.heading}>Plan to watch</Typography>
          </AccordionSummary>
          <AccordionDetails>
            <MiniMovie title='test movie' posterPath='' voteAverage='8.9' />
          </AccordionDetails>
          <AccordionDetails>
            <MiniMovie title='test movie 2' posterPath='' voteAverage='6.5' />
          </AccordionDetails>
        </Accordion>
      </div>
      <div className={classes.root}>
        <Accordion>
          <AccordionSummary
            expandIcon={<ExpandMoreIcon />}
            aria-controls='panel1a-content'
            id='panel1a-header'
          >
            <Typography className={classes.heading}>Completed</Typography>
          </AccordionSummary>
          <AccordionDetails>
            <MiniMovie
              title='test movie 3'
              posterPath=''
              voteAverage='9.2'
              userScore='7'
            />
          </AccordionDetails>
        </Accordion>
      </div>
    </>
  );
};

export default ProfilePage;
