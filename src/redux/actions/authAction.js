import { notification } from 'antd'
export const userLogin = (userCreds, userType) => {
    return async (dispatch) => {
        userCreds = {...userCreds, role_type: userType}
        console.log('@#userData',userCreds)
        //return
        dispatch({ type: 'LOGIN_USER_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/login', {
                method: 'POST', 
                headers: {
                    'Content-Type': 'application/json', 
                },
                body: JSON.stringify(userCreds), // Send the data as JSON
            });

            if (!response.ok) {
                throw new Error(`Error: ${response.status} ${response.statusText}`);
            }
            const data = await response.json();
            dispatch({ type: 'LOGIN_USER_SUCCESS', payload: data });
            // notification.success({
            //     message: 'Success',
            //    // description: 'API call succeeded.',
            //     placement: 'topRight',
            //   });
        } catch (error) {
            dispatch({ type: 'LOGIN_USER_FAILURE', payload: error.message });
        }
    };
}

export const userRegister = (userData,userType) => {
    return async (dispatch) => {
        userData = {...userData, role_type: userType}
        console.log('@#userData',userData)
        dispatch({ type: 'REGISTER_USER_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/registration', {
                method: 'POST', // Specify the HTTP method
                headers: {
                    'Content-Type': 'application/json', // Set content type
                },
                body: JSON.stringify(userData), // Send the data as JSON
            });

            if (!response.ok) {
                throw new Error(`Error: ${response.status} ${response.statusText}`);
            }
            console.log('@response >>>> ',response)
            const data = await response.json();
            dispatch({ type: 'REGISTER_USER_SUCCESS', payload: data});
        } catch (error) {
            dispatch({ type: 'REGISTER_USER_FAILURE', payload: error.message });
        }
    };
};

export const refreshRegistrationState = () => {
    return async (dispatch) => {
        dispatch({type: 'REGISTER_REFRESH'})
    }
}


export const userLogout = () => {
    return async (dispatch) => {
        dispatch({type: 'USER_LOGOUT'})
    }
}
