import React, { useState, useEffect } from 'react';

import { makeStyles } from '@material-ui/core/styles';
import Accordion from '@material-ui/core/Accordion';
import AccordionSummary from '@material-ui/core/AccordionSummary';
import AccordionDetails from '@material-ui/core/AccordionDetails';
import Typography from '@material-ui/core/Typography';
import ExpandMoreIcon from '@material-ui/icons/ExpandMore';

import MiniMovie from '../MiniMovie';

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

  const [planToWatch, setplanToWatch] = useState([]);
  const [comp, setComp] = useState([]);

  // Get the localStorage and place them into useStates
  useEffect(() => {
    for (let i = 0; i < localStorage.length; i += 1) {
      const data = JSON.parse(localStorage.getItem(localStorage.key(i)));
      if (data.status === 'planToWatch') {
        setplanToWatch((curr) => [...curr, data]);
      } else {
        setComp((curr) => [...curr, data]);
      }
    }

    // Sort the useStates by votes and by title
    setplanToWatch((curr) =>
      curr.sort((a, b) => (a.voteAverage < b.voteAverage ? 1 : -1))
    );
    setComp((curr) => curr.sort((a, b) => (a.title > b.title ? 1 : -1)));
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
          {planToWatch.map((data) => (
            <AccordionDetails key={data.id}>
              <MiniMovie
                title={data.title}
                posterPath={data.pp}
                voteAverage={data.voteAverage}
              />
            </AccordionDetails>
          ))}
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
          {comp.map((data) => (
            <AccordionDetails key={data.id}>
              <MiniMovie
                title={data.title}
                posterPath={data.pp}
                voteAverage={data.voteAverage}
                userScore={data.rating}
              />
            </AccordionDetails>
          ))}
        </Accordion>
      </div>
    </>
  );
};

export default ProfilePage;
