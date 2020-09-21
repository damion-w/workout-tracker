import React, { useState, useEffect } from 'react'
import { Redirect } from 'react-router-dom'
import Auth from '../../modules/Auth'

const Profile = () => {
    const [data, setData] = useState(null)

    useEffect(() => {
        fetch('/profile', {
            headers: {
                token: Auth.getToken(),
                'Authorization': `Token ${Auth.getToken()}`
            }
        }).then(res => res.json())
        .then(res => {
            console.log(res)
            setData(res.user)
        })
    }, [])

    return (
      <div className="profile">
        {data ? (
          <>
            <h2> Welcome to your profile, {data.username}!</h2>
            <h3>Here are your exercises</h3>
            <ul>
              {data.exercises.map((exercise) => (
                <li key={exercise.id}>
                  <h3>{exercise.name}</h3>
                  <h4>Sets: {exercise.sets}</h4>
                  <h4>Reps: {exercise.reps}</h4>
                </li>
              ))}
            </ul>
          </>
        ) : (
          <p>Loading...</p>
        )}
        {!Auth.isUserAuthenticated() && <Redirect to='/login' />}
      </div>
    );

}

export default Profile