#!/usr/bin/env node
import esbuild from 'esbuild'

const env = process.env['NODE_ENV']

const buildContext = {
  define: {
    "process.env.NODE_ENV": `'${env}'`
  },
  entryPoints: ["./app/javascript/application.ts"],
  bundle: true,
  minify: true,
  sourcemap: true,
  outdir: "./app/assets/builds",
}

if (process.argv.includes("--watch")) {
  let ctx = await esbuild.context(buildContext).catch(() => process.exit(1))
  await ctx.watch();
} 
else {
  esbuild.build(buildContext)
}