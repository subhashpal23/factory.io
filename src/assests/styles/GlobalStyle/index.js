import { createGlobalStyle } from 'styled-components';

const GlobalStyle = createGlobalStyle`
  /* Apply Roboto font across the whole application */
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Roboto', sans-serif;
  }

  body {
    font-family: 'Roboto', sans-serif;
  }

  /* You can add more global styles like background, colors etc */
  body {
    background-color: #ffffff;
  }
`;

export default GlobalStyle;
