import React from 'react';
import { Link } from 'react-router-dom';

export default () => {
    return(
        <div>
            I'm some other page! 1.2 <br/>
            <Link to="/">Go back home</Link>
        </div>
    )
};