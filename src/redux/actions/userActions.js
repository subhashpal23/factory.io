import { notification } from 'antd'
export const fetchUsers = ()=>{
    return async (dispatch) =>{
        dispatch({type: 'FETCH_USER_REQUEST'});
        try{
            const response = await fetch("https://jsonplaceholder.typicode.com/users")
            const data = await response.json();
            dispatch({ type: 'FETCH_USERS_SUCCESS', payload: data });
        }catch(error){
            dispatch({ type: 'FETCH_USERS_FAILURE', payload: error.message });
        }
    }
}

export const updateAccount = (rfq, token) => {
    return async (dispatch) => {
        dispatch({ type: 'UPDATE_ACCOUNT_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/updateUserId', {
                method: 'POST', 
                headers: {
                    'Content-Type': 'application/json', 
                'Authorization': `Bearer ${token}` 
                },
                body: JSON.stringify(rfq), // Send the data as JSON
            });

            if (!response.ok) {
                throw new Error(`Error: ${response.status} ${response.statusText}`);
            }
            const data = await response.json();
            dispatch({ type: 'UPDATE_ACCOUNT_SUCCESS', payload: data });
            notification.success({
                message: 'Account updated successfully!',
                placement: 'topRight',
              });
        } catch (error) {
            dispatch({ type: 'UPDATE_ACCOUNT_FAILURE', payload: error.message });
        }
    };
}

export const getUserInfo = (token, id)=>{
    return async (dispatch) =>{
        dispatch({type: 'FETCH_ACCOUNT_REQUEST'});
        try{
            const response = await fetch('https://factory.demosite.name/api/Api/getUserData', {
                method: 'POST', 
                headers: {
                    'Content-Type': 'application/json', 
                    'Authorization': `Bearer ${token}` 
                },
                body: JSON.stringify({"uid": id ?? null }), // Send the data as JSON
            });
            const data = await response.json();
            dispatch({ type: 'FETCH_ACCOUNT_SUCCESS', payload: data });
        }catch(error){
            dispatch({ type: 'FETCH_ACCOUNT_FAILURE', payload: error.message });
        }
    }
}