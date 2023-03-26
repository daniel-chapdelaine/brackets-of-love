import * as React from "react";
import * as ReactDOM from "react-dom/client";

interface AppProps {
  arg: string;
}

export const App = ({ arg }: AppProps) => {
  return (
    <div className="app-title text-3xl font-bold underline">
      {`Oh hello, ${arg}!`}
    </div>
   );
};

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById("root");
  const root = ReactDOM.createRoot(rootEl);
  root.render(<App arg="React" />);
});
