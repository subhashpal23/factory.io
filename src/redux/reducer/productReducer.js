const initialState = {
    products: [],
    laoding: false,
    error: null
}

const userReducer = (state = initialState, action) => {
    switch(action.type){
        case  'FETCH_PRODUCT_REQUEST' :
            return {
                ...state,
                laoding: true,
            };
        case 'FETCH_PRODUCT_SUCCESS' : 
            return {
                ...state,
                laoding: false,
                products: action.payload
            };
        case 'FETCH_PRODUCT_FAILURE' : 
            return {
                ...state,
                laoding: false,
                error: action.payload
            };
        default : 
            return {
                ...state
            }
    }
}

export default userReducer;