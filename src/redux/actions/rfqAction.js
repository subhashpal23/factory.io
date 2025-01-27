import { notification } from 'antd'
export const getRfqList = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_RFQ_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/getCustomerRFQList', {
                method: 'GET', 
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token}` 
                },
                // Send the data as JSON
            });

            if (!response.ok) {
                throw new Error(`Error: ${response.status} ${response.statusText}`);
            }
            const data = await response.json();
            dispatch({ type: 'GET_RFQ_SUCCESS', payload: data });
            // notification.success({
            //     message: 'Success',
            //    // description: 'API call succeeded.',
            //     placement: 'topRight',
            //   });
        } catch (error) {
            dispatch({ type: 'GET_RFQ_FAILURE', payload: error.message });
        }
    };
}


export const createRfq = (rfq, token) => {
    return async (dispatch) => {
        dispatch({ type: 'CREATE_RFQ_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/createRFQ', {
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
            dispatch({ type: 'CREATE_RFQ_SUCCESS', payload: data });
            notification.success({
                message: 'RFQ created successfully!',
                placement: 'topRight',
              });
        } catch (error) {
            dispatch({ type: 'CREATE_RFQ_FAILURE', payload: error.message });
        }
    };
}


export const resetRfcCreateStatus = () => {
    return async (dispatch) => {
        dispatch({type: 'RESET_RFC_CREATE_STATUS'})
    }
}