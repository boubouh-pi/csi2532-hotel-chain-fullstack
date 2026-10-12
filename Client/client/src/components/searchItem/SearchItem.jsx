import "./searchItem.css";

const SearchItem = () => {
  return (
    <div className="searchItem">
      <img
        src="C:\Users\moham\OneDrive\Bureau\chain_hotel\Client\client\public\hotel-background-sdr508awonqxixqe.jpg"
        alt=""
        className="siImg"
      />
      <div className="siDesc">
        <h1 className="siTitle">Apartments</h1>
        <span className="siDistance">Downtown</span>
        <span className="siTaxiOp">free Services</span>
        <span className="siSubtitle">
          Book now
        </span>
        <span className="siFeatures">
          
        </span>
        <span className="siCancelOp">Free cancellation </span>
        <span className="siCancelOpSubtitle">
          You can cancel later, so lock in this great price today!
        </span>
      </div>
      <div className="siDetails">
        <div className="siRating">
          <span>Excellent</span>
          <button>10</button>
        </div>
        <div className="siDetailTexts">
          <span className="siPrice">500 $</span>
          <span className="siTaxOp">Includes taxes and fees</span>
          <button className="siCheckButton">Book now</button>
        </div>
      </div>
    </div>
  );
};

export default SearchItem;
