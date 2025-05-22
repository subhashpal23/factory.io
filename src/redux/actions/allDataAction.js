import { API_URL } from "../../utils/Config";

export const getAllSupplier = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_ALL_SUPPLIER_REQUEST' });
        try {
            const response = await fetch(`${API_URL}/Api/AllSuppliers`, {
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
            dispatch({ type: 'GET_ALL_SUPPLIER_SUCCESS', payload: data.data });
        } catch (error) {
            dispatch({ type: 'GET_ALL_SUPPLIER_FAILURE', payload: error.message });
        }
    };
}


export const getAllConsumer = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_ALL_CONSUMNER_REQUEST' });
        try {
            const response = await fetch(`${API_URL}/Api/AllCustomers`, {
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
            dispatch({ type: 'GET_ALL_CONSUMNER_SUCCESS', payload: data.data });
        } catch (error) {
            dispatch({ type: 'GET_ALL_CONSUMNER_FAILURE', payload: error.message });
        }
    };
}
