import "./mailList.css"

const MailList = () => {
  return (
    <div className="mail">
      <h1 className="mailTitle">Sign up and BOOK!</h1>
      
      <div className="mailInputContainer">
        <input type="text" placeholder="Your Email" />
        <button>Book now !</button>
      </div>
    </div>
  )
}

export default MailList