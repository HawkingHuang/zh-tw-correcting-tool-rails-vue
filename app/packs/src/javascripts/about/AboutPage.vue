<script setup>
import { ref } from 'vue'
import BaseCard from '@/src/components/BaseCard.vue'

const scrollContainer = ref(null)
const sectionSignup = ref(null)
const sectionLogin = ref(null)
const sectionCheck = ref(null)
const sectionCustom = ref(null)
const sectionLibrary = ref(null)
const sectionReport = ref(null)
const sectionLogout = ref(null)

const scrollToSection = (target) => {
  const container = scrollContainer.value
  if (container && target) {
    container.scrollTo({
      top: target.offsetTop - container.offsetTop,
      behavior: 'smooth'
    })
  }
}
</script>

<template>
  <div>
    <base-card>
      <div class="grid grid-cols-8 p-2">
        <div class="col-span-1 flex flex-col items-start gap-2 md:hidden">
          <button class="default-btn hover:bg-gray-200" @click="scrollToSection(sectionSignup)">Sign Up</button>
          <button class="default-btn hover:bg-gray-200" @click="scrollToSection(sectionLogin)">Log In</button>
          <button class="default-btn hover:bg-gray-200" @click="scrollToSection(sectionCheck)">Check</button>
          <button class="default-btn hover:bg-gray-200" @click="scrollToSection(sectionCustom)" >Custom</button>
          <button class="default-btn hover:bg-gray-200" @click="scrollToSection(sectionLibrary)" >Library</button>
          <button class="default-btn hover:bg-gray-200" @click="scrollToSection(sectionReport)">Report</button>
          <button class="default-btn hover:bg-gray-200" @click="scrollToSection(sectionLogout)" >Log Out</button>
        </div>
        <div ref="scrollContainer" class="custom-scroll col-span-7 max-h-[80vh] overflow-auto rounded md:col-span-8 md:max-h-none md:w-full md:overflow-visible">
          <div class="section-about mb-4 py-2 text-lg">
            <p>
              <strong>Traditional Chinese Checker</strong> is a tool built for
              professional translators, editors, writers, researchers and students.
            </p>
          </div>

          <div ref="sectionSignup" class="mb-4 py-2 text-lg">
            <h2 class="mb-2 inline-block border-b-4 text-2xl font-bold">Sign Up</h2>
            <div class="mb-6">
              <p>
                Click <strong>Sign Up</strong> in the login page.
              </p>
              <img src="@/src/images/login.png" alt="Login page">
            </div>
            <div class="mb-6">
              <p>
                Enter your email, username and password, then click <strong>Sign Up</strong>, and you'll be good to go!
              </p>
              <img src="@/src/images/signup.png" alt="Signup page">
            </div>
          </div>

          <div ref="sectionLogin" class="mb-4 py-2 text-lg">
            <h2 class="mb-2 inline-block border-b-4 text-2xl font-bold">Log In</h2>
            <div class="mb-6">
              <p>
                Enter your username and password, then click <strong>Log In</strong>.
              </p>
              <img src="@/src/images/login2.png" alt="Login page">
            </div>
          </div>

          <div ref="sectionCheck" class="mb-4 py-2 text-lg">
            <h2 class="mb-2 inline-block border-b-4 text-2xl font-bold">Check</h2>
            <div class="mb-6">
              <p>
                Copy/paste or type content into the <strong>Original</strong> area, then click <strong>Examine</strong>.
              </p>
              <img src="@/src/images/check.png" alt="Check page">
            </div>
            <div class="mb-6">
              <p>
                The <strong>Corrected</strong> area will display the result with incorrect words in red.
              </p>
              <img src="@/src/images/check2.png" alt="Checking result">
            </div>
            <div class="mb-6">
              <p>Click <strong>Reset</strong> to clear all words.</p>
            </div>
          </div>

          <div ref="sectionCustom" class="mb-4 py-2 text-lg">
            <h2 class="mb-2 inline-block border-b-4 text-2xl font-bold">Custom</h2>
            <div class="mb-6">
              <p>
                In <strong>Custom</strong>, click <strong>Add New Words</strong> to add custom words to be checked.
              </p>
              <img src="@/src/images/custom.png" alt="Custom page">
            </div>
            <div class="mb-6">
              <p>
                Type in <strong>Correct Word</strong> and <strong>Incorrect Word</strong>, then click <strong>Confirm</strong>.
              </p>
              <img src="@/src/images/custom2.png" alt="Add custom words">
            </div>
            <div class="mb-6">
              <p>
                The index page will display the custom words you just added.
              </p>
              <img src="@/src/images/custom3.png" alt="Custom words added">
            </div>
            <div class="mb-6">
              <p>
                You can click the pencil icon to edit custom words.
              </p>
            </div>
          </div>

          <div ref="sectionLibrary" class="mb-4 py-2 text-lg">
            <h2 class="mb-2 inline-block border-b-4 text-2xl font-bold">Library</h2>
            <div class="mb-6">
              <p>
                In <strong>Library</strong>, you can view all words in our database.
              </p>
              <img src="@/src/images/library.png" alt="Library page">
            </div>
            <div class="mb-6">
              <p>
                You can click the Bopomofo dropdown to choose a specific Bopomofo category, then click <strong>Search</strong> to get the result.
              </p>
              <img src="@/src/images/library2.png" alt="Library page">
            </div>
          </div>

          <div ref="sectionReport" class="mb-4 py-2 text-lg">
            <h2 class="mb-2 inline-block border-b-4 text-2xl font-bold">Report</h2>
            <div class="mb-6">
              <p>
                In <strong>Report</strong>, you can click <strong>New Report</strong> to report words in database that you think are incorrect.
              </p>
              <img src="@/src/images/report.png" alt="Report page">
            </div>
            <div class="mb-6">
              <p>
                Choose a set of words, type in you thoughts, then click <strong>Confirm</strong> to submit your report.
              </p>
              <img src="@/src/images/report2.png" alt="Send report">
            </div>
            <div class="mb-6">
              <p>
                The index page will display the report you just submitted.
              </p>
              <img src="@/src/images/report3.png" alt="Report submitted">
            </div>
            <div class="mb-6">
              <p>
                You can click the dialog icon to reply further.
              </p>
              <img src="@/src/images/report4.png" alt="Reply further">
            </div>
          </div>

          <div ref="sectionLogout" class="mb-4 py-2 text-lg">
            <h2 class="mb-2 inline-block border-b-4 text-2xl font-bold">Logout</h2>
            <div class="mb-6">
              <p>
                You can click <strong>Log Out</strong> to log out current user.
              </p>
              <img src="@/src/images/logout.png" alt="Report page">
            </div>
          </div>
        </div>
      </div>
    </base-card>
  </div>
</template>
