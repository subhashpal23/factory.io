import { createGlobalStyle } from 'styled-components';

const GlobalStyle = createGlobalStyle`
  /* Apply Roboto font across the whole application */
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Roboto', sans-serif;
  }

  /* Ensure that the html and body elements take up the full width and height */
  html, body {
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
    background-color: #ffffff;
    overflow-x: hidden; /* Prevent horizontal scrolling */
  }

  /* #__next should also take the full width and height */
  #__next {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
  }

  main {
    width: 100%;
    //display: flex;
    //justify-content: center;
    padding: 0 10px; /* Padding for small screens */
    box-sizing: border-box;
  }

  /* Add some responsiveness */
  @media (max-width: 768px) {
    main {
      padding: 0 15px; /* More padding on smaller screens */
    }
    body {
    width: 100%;
   // display: flex;
   flex-direction: column;
    //align-items: center;
   // justify-content: flex-start;
    font-family: 'Roboto', sans-serif;
  }
  }

  /* Additional styles to prevent horizontal scroll */
  html {
    -webkit-overflow-scrolling: touch;
  }
`;

export default GlobalStyle;
