---
title: "Evals: From Caveman Testing to Confident Deployments"
theme: seriph
author: "Cam"
info: "How to test AI agents systematically and deploy with confidence"
mdc: true
transition: slide-left
lineNumbers: true
fonts:
  sans: 'Inter,Poppins,Raleway'
  mono: 'JetBrains Mono'

---

<style>
  @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800;900&family=Poppins:wght@300;400;600;700;900&family=Raleway:wght@300;400;600;800&display=swap');
  /* Cohesive color scheme: Deep purple to blue gradient theme */
  .slidev-layout { color: white !important; background: linear-gradient(135deg, #5B3FF0 0%, #3B82F6 100%) !important; }
  .slide-2 .slidev-layout,
  .slide-2.slidev-layout { background: linear-gradient(135deg, #6B3FF0 0%, #4B92F6 100%) !important; }
  .slide-3 .slidev-layout,
  .slide-3.slidev-layout { background: linear-gradient(135deg, #5B3FF0 0%, #3B82F6 100%) !important; }
  .slide-4 .slidev-layout,
  .slide-4.slidev-layout { background: linear-gradient(135deg, #4B3FE0 0%, #2B72E6 100%) !important; }
  .slide-5 .slidev-layout,
  .slide-5.slidev-layout { background: linear-gradient(135deg, #6B3FF0 0%, #4B92F6 100%) !important; }
  .slide-6 .slidev-layout,
  .slide-6.slidev-layout { background: linear-gradient(135deg, #5B3FF0 0%, #3B82F6 100%) !important; }
  .slide-7 .slidev-layout,
  .slide-7.slidev-layout { background: linear-gradient(135deg, #4B3FE0 0%, #2B72E6 100%) !important; }
  .slide-8 .slidev-layout,
  .slide-8.slidev-layout { background: linear-gradient(135deg, #6B3FF0 0%, #4B92F6 100%) !important; }
  .slide-9 .slidev-layout,
  .slide-9.slidev-layout { background: linear-gradient(135deg, #5B3FF0 0%, #3B82F6 100%) !important; }
  .slide-10 .slidev-layout,
  .slide-10.slidev-layout { background: linear-gradient(135deg, #7B4FF0 0%, #5BA2F6 100%) !important; }
  h1 { font-family: 'Poppins', sans-serif !important; font-weight: 900 !important; font-size: 3rem !important; color: white !important; text-shadow: 2px 2px 4px rgba(0,0,0,0.3); letter-spacing: -1px; }
  h2 { font-family: 'Raleway', sans-serif !important; font-weight: 800 !important; color: white !important; text-shadow: 1px 1px 3px rgba(0,0,0,0.3); }
  h3 { font-family: 'Inter', sans-serif !important; font-weight: 700 !important; color: white !important; }
  body, .slidev-layout { font-family: 'Inter', sans-serif !important; }
  .slidev-layout * { color: white; }
  .bg-white *, .bg-gray-50 *, .bg-gray-100 *, .bg-slate-50 *, .bg-slate-100 *,
  .bg-indigo-50 *, .bg-blue-50 * { color: #1a202c !important; }
  .slidev-layout::before { content: ''; position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0, 0, 0, 0.1); z-index: 0; }
  .slidev-layout > * { position: relative; z-index: 1; }
</style>

# Evals
## From Caveman Testing to Confident Deployments

<div class="mt-10 opacity-90">
  <div class="text-xl">Cam</div>
  <div class="text-sm mt-2">Senior AI Dev</div>
  <div class="text-xs mt-4 opacity-75">Building agents since DaVinci | Blog writer | Open source contributor</div>
</div>

<div class="absolute bottom-10 text-sm opacity-75">
  Andres defined agents → I test & productionize them<br/>
  <span class="text-xs">(agents = workflows here)</span>
</div>

---
layout: default
class: slide-2
---

# Life Without Evals

<div class="text-xl mb-8 opacity-90">If you're not already doing evals, you're probably doing something like this...</div>

<div class="bg-gray-100 p-6 rounded-lg text-black">
  <div class="text-lg font-semibold mb-4">📞 Scenario: Phone Directory Agent</div>
  <div class="text-sm mb-4">An agent responsible for giving the correct department phone number out of 10 departments</div>
</div>

<div class="mt-8">
<v-clicks>

### The Caveman Testing Process:

1. 🖥️ Open your app
2. 🔄 Try a few queries that should trigger the behavior
3. 🔧 Tweak your code/prompt
4. 🔁 Try again to see if it worked
5. 😫 Repeat for multiple test cases

<div class="text-sm opacity-75 mt-2">(🔴 Worst case: Having prompts in notepad you copy-paste)</div>

</v-clicks>
</div>

---
layout: default
class: slide-3
---

# Why This Sucks

<div class="grid grid-cols-2 gap-6 mt-6 auto-rows-fr">
<v-clicks>

<div class="bg-white p-5 rounded-xl border-2 border-slate-200 shadow-lg">
  <div class="text-2xl mb-3">🐌</div>
  <div class="font-bold text-lg mb-2">Slow Iterations</div>
  <div class="text-sm">Each step is painfully slow</div>
</div>

<div class="bg-slate-50 p-5 rounded-xl border-2 border-slate-200 shadow-lg">
  <div class="text-2xl mb-3">📊</div>
  <div class="font-bold text-lg mb-2">Low Coverage</div>
  <div class="text-sm">You can only test a handful of examples</div>
</div>

<div class="bg-white p-5 rounded-xl border-2 border-slate-200 shadow-lg">
  <div class="text-2xl mb-3">🤝</div>
  <div class="font-bold text-lg mb-2">Hard to Share</div>
  <div class="text-sm">Can't easily share findings or track progress</div>
</div>

<div class="bg-slate-50 p-5 rounded-xl border-2 border-slate-200 shadow-lg">
  <div class="text-2xl mb-3">🛏️</div>
  <div class="font-bold text-lg mb-2">The Short Blanket Problem</div>
  <div class="text-sm">Cover your neck, feet get cold<br/>Cover your feet, neck gets cold</div>
</div>

</v-clicks>

<div v-click class="col-span-2 p-5 bg-gray-100 rounded-xl text-black shadow-xl">
  <div class="font-bold text-lg mb-1">📈 No Data to Drive Decisions</div>
  <div class="text-sm">Everything is based on vibes. Can't say "we solve this 95% of the time".</div>
</div>
</div>

---
layout: center
class: text-center slide-4
---

<div>

<div class="text-6xl font-bold mb-4 drop-shadow-lg">
  There Has Got to Be a Better Way
</div>

<div v-click class="text-2xl mt-8 drop-shadow-md">
  What are we looking for?
</div>

<div v-click class="text-xl mt-4 drop-shadow-md">
  Ideally: Run a script and see exactly how often<br/>the agent gives the correct phone number
</div>

</div>

---
layout: default
class: slide-5
---

# Enter Evals

<div class="text-lg mb-6 opacity-90">How can we automate that caveman testing process?</div>

<div class="grid grid-cols-2 gap-6">
<div>

## 📝 Minimum Viable Eval

<div v-click class="bg-white/90 backdrop-blur p-4 rounded-lg mt-4" style="color: #1a202c !important;">

Imagine a script that:
- Takes your list of queries
- Runs them in parallel
- Gives you a table of results

**✨ You're doing evals!**

</div>

<div v-click class="text-sm opacity-80 mt-4">
Already way better than caveman testing
</div>

</div>
<div>

## 🚀 Scale Up Complexity

<v-clicks>

<div class="bg-white/90 backdrop-blur p-3 rounded-lg mb-2 border border-slate-200" style="color: #1a202c !important;">
  <div class="text-sm"><span class="font-bold">Level 1:</span> Check if correct number mentioned</div>
</div>

<div class="bg-slate-50 p-3 rounded-lg mb-2 border border-slate-200" style="color: #1a202c !important;">
  <div class="text-sm"><span class="font-bold">Level 2:</span> LLM-as-judge for quality scoring</div>
</div>

<div class="bg-white/90 backdrop-blur p-3 rounded-lg mb-2 border border-slate-200" style="color: #1a202c !important;">
  <div class="text-sm"><span class="font-bold">Level 3:</span> Trajectory evals</div>
</div>

<div class="bg-slate-50 p-3 rounded-lg border border-slate-200" style="color: #1a202c !important;">
  <div class="text-sm"><span class="font-bold">Level 4:</span> Production analysis</div>
</div>

</v-clicks>

</div>
</div>

<div v-click class="mt-4 p-3 bg-gray-100 rounded-lg text-black">
  <div class="font-bold mb-1 text-sm">🛠️ Implementation Options:</div>
  <div class="text-xs">
    • LangSmith • Open source frameworks<br/>
    • Testing frameworks (pytest) • Roll your own
  </div>
</div>

---
layout: default
class: slide-6
---

# When NOT to Use Evals

<div class="text-lg mb-8 opacity-90">Real examples: Some people on Twitter say evals are dead.</div>

<div class="grid grid-cols-2 gap-6">
<div>

## 🎨 Claude Code & NotebookLM

They can get away with it because:

<v-clicks>

<div class="bg-white/90 backdrop-blur p-4 rounded-lg mb-3 border border-slate-200" style="color: #1a202c !important;">
  <span class="font-bold">Highly subjective</span><br/>
  <span class="text-sm">AI podcast quality is hard to measure</span>
</div>

<div class="bg-slate-50 p-4 rounded-lg mb-3 border border-slate-200" style="color: #1a202c !important;">
  <span class="font-bold">Reliability isn't crucial</span><br/>
  <span class="text-sm">Users expect some failures</span>
</div>

<div class="bg-white/90 backdrop-blur p-4 rounded-lg border border-slate-200" style="color: #1a202c !important;">
  <span class="font-bold">Strong QA process</span><br/>
  <span class="text-sm">Thorough dogfooding with tight feedback loops</span>
</div>

</v-clicks>

</div>
<div v-click>

## ⚠️ Our Reality

<div class="bg-slate-100 p-6 rounded-lg border-2 border-slate-300 mt-4">
  <div class="text-2xl mb-3">🚫</div>
  <div class="font-bold text-lg">These don't apply to our use case!</div>
  <div class="text-sm mt-2">
    Phone numbers need to be correct.<br/>
    Users expect reliability.<br/>
    We can measure success objectively.
  </div>
</div>

</div>
</div>

---
layout: default
class: slide-7
---

# Evals vs Traditional Tests

<div class="opacity-90 mb-6">If you're used to traditional tests, all the same rules apply.</div>

<div class="bg-white/90 backdrop-blur p-4 rounded-lg mb-6 border border-slate-200" style="color: #1a202c !important;">
  <div class="text-lg font-bold mb-2">Key Differences</div>
  <div class="text-sm text-gray-600">They complement each other!</div>
</div>

<div class="grid grid-cols-2 gap-4">
<v-clicks>

<div class="bg-white p-4 rounded-lg border border-slate-200" style="color: #1a202c !important;">
  <div class="font-bold text-slate-700 mb-2">📊 Pass Rates</div>
  <div class="text-sm">
    <div class="mb-1"><span class="font-semibold">Tests:</span> 100% or fail</div>
    <div><span class="font-semibold">Evals:</span> 90% might be fine</div>
  </div>
</div>

<div class="bg-slate-50 p-4 rounded-lg border border-slate-200" style="color: #1a202c !important;">
  <div class="font-bold text-slate-700 mb-2">🎯 Purpose</div>
  <div class="text-sm">
    <div class="mb-1"><span class="font-semibold">Tests:</span> "Are pieces working?"</div>
    <div><span class="font-semibold">Evals:</span> "When does it fail?"</div>
  </div>
</div>

<div class="bg-white p-4 rounded-lg border border-slate-200" style="color: #1a202c !important;">
  <div class="font-bold text-slate-700 mb-2">⏱️ Timing</div>
  <div class="text-sm">
    <div class="mb-1"><span class="font-semibold">Tests:</span> Every merge, CI</div>
    <div><span class="font-semibold">Evals:</span> When needed</div>
    <div class="text-xs text-gray-500 mt-1">(new model, doc changes)</div>
  </div>
</div>

<div class="bg-slate-50 p-4 rounded-lg border border-slate-200" style="color: #1a202c !important;">
  <div class="font-bold text-slate-700 mb-2">💰 Cost & Speed</div>
  <div class="text-sm">
    Evals are expensive and slower than tests
  </div>
</div>

</v-clicks>
</div>


---
layout: default
class: slide-8
---

# Tips and Tricks

<div class="grid grid-cols-2 gap-6 mt-8">
<v-clicks>

<div class="bg-white/90 backdrop-blur p-4 rounded-lg border border-slate-200" style="color: #1a202c !important;">
  <div class="text-lg mb-1">🎯</div>
  <div class="font-bold text-sm">Test outputs, not implementation</div>
  <div class="text-xs text-gray-600">Don't test if it used tool X at time Y</div>
</div>

<div class="bg-slate-50 p-4 rounded-lg border border-slate-200" style="color: #1a202c !important;">
  <div class="text-lg mb-1">⚡</div>
  <div class="font-bold text-sm">Evals should be quick</div>
  <div class="text-xs text-gray-600">Build in hours, not weeks</div>
</div>

<div class="bg-white/90 backdrop-blur p-4 rounded-lg border border-slate-200" style="color: #1a202c !important;">
  <div class="text-lg mb-1">🧪</div>
  <div class="font-bold text-sm">Treat as experiments</div>
  <div class="text-xs text-gray-600">Test anything: hallucinations, coverage, tools</div>
</div>

<div class="bg-slate-50 p-4 rounded-lg border border-slate-200" style="color: #1a202c !important;">
  <div class="text-lg mb-1">🤖</div>
  <div class="font-bold text-sm">Lean on synthetic data</div>
  <div class="text-xs text-gray-600">Use strongest model to create diverse examples</div>
</div>

<div class="bg-white/90 backdrop-blur p-4 rounded-lg border border-slate-200" style="color: #1a202c !important;">
  <div class="text-lg mb-1">👀</div>
  <div class="font-bold text-sm">Look at your data</div>
  <div class="text-xs text-gray-600">Don't trust judges blindly - vibe-check yourself</div>
</div>

<div class="bg-slate-50 p-4 rounded-lg border border-slate-200" style="color: #1a202c !important;">
  <div class="text-lg mb-1">🔧</div>
  <div class="font-bold text-sm">Build reusable components</div>
  <div class="text-xs text-gray-600">Datasets, targets, evaluators - mix & match</div>
</div>

</v-clicks>
</div>

<div v-click class="mt-4 p-3 bg-slate-100 rounded-lg border-l-4 border-slate-400" style="color: #1a202c !important;">
  <div class="text-xs">
    <span class="font-bold">⚡ Pro tip:</span> Test your tools thoroughly - garbage in, garbage out!
  </div>
</div>

---
layout: default
class: slide-9
---

# Quick Start - The Stress Testing Flow

<div class="grid grid-cols-3 gap-3 mt-6">
<v-clicks>

<div class="bg-white/90 backdrop-blur p-4 rounded-lg border border-slate-200" style="color: #1a202c !important;">
  <div class="text-2xl mb-2 text-center">📊</div>
  <div class="font-bold text-base mb-2" style="color: #1a202c !important;">1. Gather Data</div>
  <ul class="text-xs space-y-1" style="color: #1a202c !important;">
    <li style="color: #1a202c !important;">• Run 1 question per department</li>
    <li style="color: #1a202c !important;">• Pull from LangSmith traces</li>
    <li style="color: #1a202c !important;">• Generate synthetic examples</li>
  </ul>
</div>

<div class="bg-slate-50 p-4 rounded-lg border border-slate-200" style="color: #1a202c !important;">
  <div class="text-2xl mb-2 text-center">🎯</div>
  <div class="font-bold text-base mb-2" style="color: #1a202c !important;">2. Target Function</div>
  <ul class="text-xs space-y-1" style="color: #1a202c !important;">
    <li style="color: #1a202c !important;">• Simple wrapper for agent</li>
    <li style="color: #1a202c !important;">• Returns output</li>
    <li style="color: #1a202c !important;">• Reuse from other evals</li>
  </ul>
</div>

<div class="bg-white/90 backdrop-blur p-4 rounded-lg border border-slate-200" style="color: #1a202c !important;">
  <div class="text-2xl mb-2 text-center">🔄</div>
  <div class="font-bold text-base mb-2" style="color: #1a202c !important;">3. Evaluate & Iterate</div>
  <ul class="text-xs space-y-1" style="color: #1a202c !important;">
    <li style="color: #1a202c !important;">• Write string match eval</li>
    <li style="color: #1a202c !important;">• Run evals</li>
    <li style="color: #1a202c !important;">• Tweak prompt/code</li>
    <li style="color: #1a202c !important;">• Re-run until satisfied</li>
  </ul>
</div>

</v-clicks>
</div>

<div v-click class="mt-8 text-center">

```mermaid {scale: 0.7}
graph LR
    A[Gather Data] --> B[Create Target]
    B --> C[Run Evals]
    C --> D{Pass Rate OK?}
    D -->|No| E[Tweak Code]
    E --> C
    D -->|Yes| F[Deploy!]
```

</div>

---
layout: center
class: text-center slide-10
---

<div>

<h1 class="drop-shadow-lg">Closing Thoughts</h1>

<div class="text-2xl mt-8 mb-12 drop-shadow-md">
  Evals should be a <span class="font-bold underline">relief</span> from the pain of Caveman testing
</div>

<v-clicks>

<div class="text-xl mb-6 drop-shadow-md">
  🔧 The Evals modules compound → so start!
</div>

<div class="text-xl mb-6 drop-shadow-md">
  🗑️ There's so many bad AI products out there
</div>

<div class="text-3xl font-bold mt-10 drop-shadow-lg">
  Be confident in yours 💪
</div>

</v-clicks>

</div>
