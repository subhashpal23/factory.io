//import { showErrorNotification, showSuccessNotification } from '../utils/AppNotification';
import { showErrorNotification, showSuccessNotification } from "../../utils/AppNotification";
import { API_URL } from '../../utils/Config';

export const assignRfqToSupplier = (request, token) => {
    return async (dispatch) => {
        dispatch({ type: 'ASSIGN_SUPPLIER_RFQ_REQUEST' });
        try {
            const response = await fetch(`${API_URL}/Api/assignRFQ`, {
                method: 'POST', 
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token}` 
                },
                body: JSON.stringify(request), 
            });

            if (!response.ok) {
                throw new Error(`Error: ${response.status} ${response.statusText}`);
            }
            const data = await response.json();
            showSuccessNotification(data.message)
            dispatch({ type: 'ASSIGN_SUPPLIER_RFQ_SUCCESS', payload: data.data });

        } catch (error) {
            showErrorNotification(error.message)
            dispatch({ type: 'ASSIGN_SUPPLIER_RFQ_FAILURE', payload: error.message });
        }
    };
}

export const resetAssignRfqStatus = () => {
    return async (dispatch) => {
        dispatch({type: 'RESET_RFQ_ASSIGN_STATUS'})
    }
}


