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

  const [ptw, setPtw] = useState([]);
  const [comp, setComp] = useState([]);

  useEffect(() => {
    for (let i = 0; i < localStorage.length; i += 1) {
      const data = JSON.parse(localStorage.getItem(localStorage.key(i)));
      if (data.status === 'ptw') {
        setPtw((curr) => [...curr, data]);
      } else {
        setComp((curr) => [...curr, data]);
      }
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
          {ptw.map((data) => (
            <AccordionDetails>
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
            <AccordionDetails>
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
