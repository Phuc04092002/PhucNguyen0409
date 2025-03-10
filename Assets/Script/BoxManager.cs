using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class BoxManager : MonoBehaviour
{
    private string BoxTag = "CurrentBox", BoostedTag= "BoostedBox";
    public Transform NextBox, VoidBox, BoxCover;
    private Vector3 currentPosition, waitingPosition, BoostPosition;
    private static Vector2 Boost1 = new Vector2(0.1f, 2.2f);
    private static Vector2 Boost2 = new Vector2(-2.5f, 2.2f);
    private static Vector2 Boost3 = new Vector2(-1.2f, 2.2f);
    private bool SetBoostPosition = true;
    // Start is called before the first frame update
    void Start()
    {
        DOTween.SetTweensCapacity(1000, 100);
        if (transform.tag == BoxTag)
        {
            //GameManager.instance.currentBoxPosition = transform.position;
            //currentPosition = transform.position;
        }
        else
        {

        }
        waitingPosition = transform.position;
    }

    // Update is called once per frame
    void Update()
    {
        if (transform.tag == BoostedTag)
        {
            BoostPosition = transform.position;
        }

        if (GameManager.instance.FullBox == true)
        {
            if (GameManager.instance.BoxBoosted == true)
            {
                DestroyFullBox2();
                DestroyFullBoostedBox();
                MoveBoxToBox();
                Invoke("MoveBoxAfterBoostedFull", 0.5f);
                //Invoke("SetBoxBoosted", 1f);
                //GameManager.instance.BoxBoosted = false;
                //GameManager.instance.FullBox = false;
            }
            else
            {
                //BoxCovered();
                DestroyFullBox();
                MoveBoxToBox();
            }
        }
        if (GameManager.instance.FullBox == false)
        {
            if(NextBox != null && GameManager.instance.BoxBoosted == true)
            {
                //Invoke ("MoveBoostedBox",0.5f);
                MoveBoostedBox();
                if (SetBoostPosition == true)
                {
                    NextBoostedBox();
                }
            }
            waitingPosition = transform.position;
        }
        if ( GameManager.instance.BoxBooster == true && transform.tag == BoxTag)
        {
            if (NextBox != null)
            {
                GameManager.instance.BoxBDown();
                NextBox.tag = BoostedTag;
                SetBoostPosition = true;
                GameManager.instance.BoxBoosted = true;
            }
            GameManager.instance.BoxBooster = false;
        }
    }
    public void MoveBoxToBox() // Di chuyển hộp 
    {

        if (NextBox != null && transform.position != waitingPosition /*&& transform.tag != BoostedTag*/)
        {
            Tween MoveBox = NextBox.DOMove(waitingPosition, 0.7f);
            MoveBox.SetEase(Ease.OutBack, overshoot: 1f);
            MoveBox.OnComplete(() => // làm gì sau khi di chuyển tới nơi 
            {

            });
        }
    }
    //public void BoxCovered()
    //{
    //    if (transform.tag == BoxTag)
    //    {
    //        BoxCover.SetParent(transform, true);
    //        Tween MoveBoxCover = BoxCover.DOMove(transform.position, 0.1f);
    //        MoveBoxCover.SetEase(Ease.Linear);
    //        MoveBoxCover.OnComplete(() => { });
    //    }
    //}
    public void DestroyFullBox() // Di chuyển hộp đã đầy
    {
        if (transform.tag == BoxTag)
        {
            Tween MoveFullBox = transform.DOMove(VoidBox.position, 0.3f);
            //MoveFullBox.SetEase(Ease.OutQuad, overshoot: 0.5f);
            MoveFullBox.SetEase(Ease.OutBack);
            MoveFullBox.OnComplete(() => // làm gì sau khi di chuyển tới nơi 
            {
                transform.tag = "Untagged";
                GameManager.instance.FullBox = false;
                if (NextBox != null)
                {
                    NextBox.tag = BoxTag;
                }
                else
                {
                    GameManager.instance.OnSuccessPopUp();
                }
                gameObject.SetActive(false);
            });
        }
    }
    public void DestroyFullBox2() // Di chuyển hộp đã đầy
    {
        if (transform.tag == BoxTag)
        {
            Tween MoveFullBox = transform.DOMove(VoidBox.position, 0.3f);
            //MoveFullBox.SetEase(Ease.OutQuad, overshoot: 0.5f);
            MoveFullBox.SetEase(Ease.OutBack);
            MoveFullBox.OnComplete(() => // làm gì sau khi di chuyển tới nơi 
            {
                transform.tag = "Untagged";
                gameObject.SetActive(false);
            });
        }
    }
    public void DestroyFullBoostedBox() // Di chuyển hộp đã đầy
    {
        if (transform.tag == BoostedTag)
        {
            Tween MoveFullBox = transform.DOMove(VoidBox.position, 0.5f);
            //MoveFullBox.SetEase(Ease.OutQuad, overshoot: 0.5f);
            MoveFullBox.SetEase(Ease.OutBack);
            MoveFullBox.OnComplete(() => // làm gì sau khi di chuyển tới nơi 
            {
                //GameManager.instance.FullBox = false;
                if (NextBox != null)
                {
                    NextBox.tag = BoxTag;
                }
                else
                {
                    GameManager.instance.OnSuccessPopUp();
                }
                gameObject.SetActive(false);
            });
        }
    }
    public void MoveBoxAfterBoostedFull()
    {
        if ( transform.tag == BoostedTag)
        {
            if (NextBox != null)
            {
                Tween MoveNextBoostedBox = NextBox.DOMoveX(Boost3.x, 1f);
                MoveNextBoostedBox.SetEase(Ease.OutBack, overshoot: 1f);
                MoveNextBoostedBox.OnComplete(() =>
                {
                    GameManager.instance.BoxBoosted = false;
                    GameManager.instance.FullBox = false;
                    transform.tag = "Untagged";
                });
            }
        }
    }
    public void SetBoxBoosted()
    {
        GameManager.instance.BoxBoosted = false;
    }

    public void MoveBoostedBox()
    {
        if (transform.tag == BoxTag)
        {
            if( NextBox != null && NextBox.tag == BoostedTag )
            {
                Tween MoveMainBox = transform.DOMoveX(Boost1.x, 1f);
                Tween MoveBoostBox = NextBox.DOMoveX(Boost2.x, 1f);
                MoveMainBox.SetEase(Ease.OutBack);
                MoveBoostBox.SetEase(Ease.OutBack);
                MoveBoostBox.OnComplete(() =>
                {

                });
            }
        }
    }
    public void NextBoostedBox()
    {
        if (transform.tag == BoostedTag)
        {
            Tween MoveNextBoostedBox = NextBox.DOMove(BoostPosition, 0.5f);
            MoveNextBoostedBox.SetEase(Ease.OutQuad);
            SetBoostPosition = false;
        }
    }
}

