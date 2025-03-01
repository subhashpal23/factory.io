const initialState = {
    users: [],
    laoding: false,
    error: null,
    accountUpdateStatus: false,
    userDetail: {},
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

        case 'UPDATE_ACCOUNT_REQUEST':
        return { ...state, loading: true};
        case 'UPDATE_ACCOUNT_SUCCESS':
          return { ...state, loading: false, accountUpdateStatus: true };
        case 'UPDATE_ACCOUNT_FAILURE':
            return { ...state, loading: false, accountUpdateStatus: false };

        case 'FETCH_ACCOUNT_REQUEST':
        return { ...state, loading: true};
        case 'FETCH_ACCOUNT_SUCCESS':
          return { ...state, loading: false, userDetail: action.payload?.data  };
        case 'FETCH_ACCOUNT_FAILURE':
            return { ...state, loading: false, userDetail: {} };

        default : 
                return state;
    }
}

export default userReducer;