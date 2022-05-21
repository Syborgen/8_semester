class IEmulator {
 public:
  virtual ~IEmulator() = default;
};

class DendyEmulator : public IEmulator {

};

class PSEmulator : public IEmulator {

};