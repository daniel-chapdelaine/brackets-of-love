import React from "react";
import { render, screen } from "@testing-library/react";
import { expect } from "chai";
import { App } from "./App";


it("Render Test", async () => {
    render(<App arg={'howdy'}/>);

    const helloText = await screen.getByText("OH, hello, howdy!");
    expect(helloText).to.be.not.null;
});