export const fetchProducts = () => {
    return async (dispatch) => {
        dispatch({ type: 'FETCH_PRODUCT_REQUEST' });
        try {
            const response = await fetch('https://fakestoreapi.com/products');
            const data = await response.json();
            dispatch({ type: 'FETCH_PRODUCT_SUCCESS', payload: data });
        } catch (error) {
            dispatch({ type: 'FETCH_PRODUCT_FAILURE', payload: error.message });
        }
    };
};
