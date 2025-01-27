const initialState = {
    users: [],
    laoding: false,
    error: null
}

const userReducer = (state = initialState, action) => {
    switch(action.type){
        case  'FETCH_USER_REQUEST' :
            return {
                ...state,
                laoding: true,
            };
        case 'FETCH_USERS_SUCCESS' : 
            return {
                ...state,
                laoding: false,
                users: action.payload
            };
        case 'FETCH_USERS_FAILURE' : 
            return {
                ...state,
                laoding: false,
                error: action.payload
            };
        default : 
            return state;
    }
}

export default userReducer;