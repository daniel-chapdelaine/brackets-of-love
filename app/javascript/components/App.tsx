import * as React from "react";
import * as ReactDOM from "react-dom/client";
import "./App.css";


interface AppProps {
  arg: string;
}

export const App = ({ arg }: AppProps) => {
  return <div className="title">{`OH, hello, ${arg}!`}</div>;
};

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  const root = ReactDOM.createRoot(rootEl);
  root.render(<App arg="React" />);
});
