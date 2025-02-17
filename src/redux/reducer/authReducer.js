const initialState = {
    logindata: JSON.parse(localStorage.getItem('logindata')) || undefined, // Load from localStorag
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
           
            localStorage.removeItem('logindata');

            let newLoginData = action?.payload;

            if(action.payload?.status){
                let newLoginData = {
                    ...action?.payload,
                    token: action.payload.token,
                    expires_at: action.payload.expires_at,
                    data: {
                        id: action.payload.data.id,
                        is_validated: action.payload.data.is_validated,
                        marketing_consent: action.payload.data.marketing_consent,
                        industry: action.payload.data.industry,
                        role_type: action.payload.data.role_type,
                        email_verify: action.payload.data.email_verify,
                        email_verify_date: action.payload.data.email_verify_date,
                    }
                };
            
    
               localStorage.setItem('logindata', JSON.stringify(newLoginData));
            }

            return {
                ...state,
                laoding: false,
                logindata: newLoginData,
            };
        case  'LOGIN_USER_FAILURE' : 
        return {
            ...state,
            laoding: false,
            loginError: action.payload
        };
        
        case 'USER_LOGOUT':
            localStorage.removeItem('logindata');

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