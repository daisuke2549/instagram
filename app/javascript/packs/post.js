import $ from 'jquery'
import axios from 'axios'
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()
const handleHeartDisplay = (hasLiked) => {
  if (hasLiked) {
    $('.active-heart').removeClass('hidden')
  } else {
    $('.inactive-heart').removeClass('hidden')
  }
}

document.addEventListener('DOMContentLoaded', () => {
    const dataset = $('#post-show').data()
    const postId = dataset.postId

  axios.get(`/posts/${postId}/comments`)
  .then((response) => {
    const comments = response.data
    comments.forEach((comment) => {
      $('.comments-container').append(
        `<div class="post_comment"><p>${comment.content}</p></div>`
      )
    })
  })

})