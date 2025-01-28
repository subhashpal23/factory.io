import { notification } from 'antd'
export const getSupplierList = (token) => {
    return async (dispatch) => {
        //return
        dispatch({ type: 'GET_SUPPLIER_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/getMySuppliers', {
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
            dispatch({ type: 'GET_SUPPLIER_SUCCESS', payload: data });
         } catch (error) {
            dispatch({ type: 'GET_SUPPLIER_FAILURE', payload: error.message });
        }
    };
}
