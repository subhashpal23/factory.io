const initialState = {
    logindata: undefined,
    loginError: null,
    registrationData: undefined, 
    registrationError: null,
    laoding: false,
}

const authReducer = (state = initialState, action) => {
    switch(action.type){
        case  'REGISTER_USER_REQUEST':
            return {
                ...state,
                laoding: true,
            };
        case  'REGISTER_USER_SUCCESS':
            return {
                ...state,
                laoding: false,
                registrationData: action.payload
            };
        case  'REGISTER_USER_FAILURE' : 
        return {
            ...state,
            laoding: false,
            registrationError: action.payload
        };
        case 'REGISTER_REFRESH':
            return {
                ...state,
                registrationData: undefined
            }
        case  'LOGIN_USER_REQUEST':
            return {
                ...state,
                laoding: true,
            };
        case  'LOGIN_USER_SUCCESS':
            return {
                ...state,
                laoding: false,
                logindata: action.payload
            };
        case  'LOGIN_USER_FAILURE' : 
        return {
            ...state,
            laoding: false,
            loginError: action.payload
        };
        
        case 'USER_LOGOUT':
            return {
                ...state,
                logindata: undefined,
                loginError: null,
                registrationData: undefined, 
                registrationError: null,
                laoding: false,
            }
        default : 
            return {
                ...state
        }
    }
}

export default authReducer;