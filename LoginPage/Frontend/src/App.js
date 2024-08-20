import React from "react";
import { BrowserRouter, Routes, Route,Navigate, Link } from "react-router-dom";

import Layout from "./components/Layout";

// import
import { BiconomyProvider } from "./components/Hooks/Connection";
export const App = () =>{

    // Render the protected routes if authenticated
  

    return (
      <BiconomyProvider>
      <div>
        <Routes>

          <Route element={<Layout />}>
         
         
          </Route>
        </Routes>
      </div>
      </BiconomyProvider>
    );
  
}


