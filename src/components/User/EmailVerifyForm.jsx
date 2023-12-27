"use client";
import { useState } from "react";
import { ErrorToast, SuccessToast, IsEmail } from "@/utility/FormHelper";
import SubmitButton from "@/components/SubmitButton/SubmitButton";

const EmailVerifyForm = () => {
  const [data, setData] = useState({ email: "" });
  const [submit, setSubmit] = useState(false);

  const inputOnChange = (name, value) => {
    setData((data) => ({
      ...data,
      [name]: value,
    }));
  };

  const formSubmit = async (e) => {
    e.preventDefault();

    if (IsEmail(data.email)) {
      ErrorToast("Valid Email Address Required");
    } else {
      setSubmit(true);

      const options = {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
        },
        body: JSON.stringify(data),
      };

      try {
        let res = await fetch("/api/user/recover", options);
        let ResJson = await res.json();

        setSubmit(false);

        if (ResJson.status === "success") {
          SuccessToast("Email Verified Success");
          // Assuming SuccessToast is defined and implemented
          window.location.href = "/User/PINVerify";
        } else {
          ErrorToast("Request Fail");
        }
      } catch (error) {
        console.error("Error during form submission:", error);
        ErrorToast("An error occurred during submission");
        setSubmit(false);
      }
    }
  };

  return (
    <div className="row h-100 justify-content-center center-screen">
      <div className="col-md-4 col-lg-4 col-sm-12 col-12 ">
        <form
          onSubmit={formSubmit}
          className="card animated fadeIn p-5 gradient-bg"
        >
          <h5 className="mb-3">Email Address</h5>
          <label className="form-label">User Email</label>
          <input
            onChange={(e) => {
              inputOnChange("email", e.target.value);
            }}
            type="email"
            className="form-control mb-2"
          />
          <SubmitButton
            className="btn btn-danger mt-3"
            submit={submit}
            text="Next"
          />
        </form>
      </div>
    </div>
  );
};

export default EmailVerifyForm;
