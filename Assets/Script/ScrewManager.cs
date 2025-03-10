using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
using TMPro;
using System.Text;
using static UnityEngine.UI.Image;
//using Unity.VisualScripting;

public class ScrewManager : MonoBehaviour
{
    private Animator animator;
    public LayerMask ignoreLayers; // danh sách layer chỉ định
    private string BoxTag = "CurrentBox", HoleTag = "WaitHoles", BoostedTag = "BoostedBox", StarScrewTag = "StarScrew", StarSlotTag = "StarSlot";
    public Transform[] ScrewHoles;
    public Transform[] WaitHoles;
    private bool[] holeInUse;
    private bool[] WholeInUse;
    private static int ActiveWholesIndex =5;
    //private bool Isfull = false;
    private int holeFullCount = 0, HoleWaitingCount = 0;
    private bool SetTrue, SetHole, SetRotate, CheckPopUp = true;
    private float speed = 20f, StarSlotCount, BoostStarSlotCount;
    public Camera mainCamera; // Camera chính
    public LayerMask layerMask; // Lớp để kiểm tra va chạm
    public float rayDistance = 100f; // Khoảng cách tối đa của raycast

    void Start()
    {
        CheckPopUp = true;
        holeInUse = new bool[ScrewHoles.Length];
        WholeInUse = new bool[WaitHoles.Length];
        animator = transform.parent.GetComponent<Animator>();
    }
    private void Update()
    {
        holeFullCount = 0;
        HoleWaitingCount = 0;
        // KeepPlaying
        if (GameManager.instance.ClickedKP == true)
        {
            ActiveWholesIndex = 0;
            for (int i = 0; i < WaitHoles.Length; i++)
            {
                if (WaitHoles[i].gameObject.activeSelf == true)
                {
                    ActiveWholesIndex++;
                }
            }
            if (ActiveWholesIndex < 8)
            {
                WaitHoles[ActiveWholesIndex].gameObject.SetActive(true);
                WaitHoles[ActiveWholesIndex + 1].gameObject.SetActive(true);
                ActiveWholesIndex += 2;
            }
            else if (ActiveWholesIndex == 8)
            {
                WaitHoles[ActiveWholesIndex].gameObject.SetActive(true);
                ActiveWholesIndex++;
            }
            CheckPopUp = true;
            GameManager.instance.ClickedKP = false;
        }
        // HoleBooster
        if (GameManager.instance.HoleBooster == true)
        {
            GameManager.instance.HoleBDown();
            ActiveWholesIndex = 0;
            for (int i = 0; i < WaitHoles.Length; i++)
            {
                if (WaitHoles[i].gameObject.activeSelf == true)
                {
                    ActiveWholesIndex++;

                }
            }
            if (ActiveWholesIndex < 9)
            {
                WaitHoles[ActiveWholesIndex].gameObject.SetActive(true);
                ActiveWholesIndex++;
                CheckPopUp = true;
            }
            GameManager.instance.HoleBooster = false;
            if (ActiveWholesIndex >= 9)
            {
                GameManager.instance.CheckHoleCount = true;
            }
            else
            {
                GameManager.instance.CheckHoleCount = false;
            }
        }
        if (GameManager.instance.HammerBooster == false)
        {
            if (Input.GetMouseButtonDown(0))
            {
                // Bỏ qua raycast các layer chỉ định
                Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
                RaycastHit2D hit = Physics2D.Raycast(ray.origin, ray.direction, Mathf.Infinity, ~ignoreLayers);
                // Duyệt qua tất cả các lỗ vít
                if (hit.collider)
                {
                    if (hit.collider.gameObject == gameObject)
                    {
                        //CircleCollider2D circleCollider = GetComponent<CircleCollider2D>();
                        //Physics2D.IgnoreCollision(circleCollider, circleCollider, true);
                        //float radius = circleCollider.radius;
                        //Vector3 origin = gameObject.transform.position;
                        //Vector3 direction = mainCamera.transform.position - gameObject.transform.position;
                        //direction.Normalize();
                        //RaycastHit2D Screwhit = Physics2D.Raycast(origin, /*radius,*/ direction, Mathf.Infinity, layerMask);
                        //Debug.DrawRay(origin, direction, Color.red, Mathf.Infinity);
                        //if (Screwhit.collider != null)
                        //{
                        //    Debug.Log("a" + Screwhit.collider.gameObject.name);
                        //}
                        //if (Screwhit.collider == null)
                        //{
                            StarSlotCount = 0;
                                // lấy mã màu hexadecimal của object
                                SpriteRenderer spriteRenderer = GetComponent<SpriteRenderer>();
                                string objectHexColor = ColorUtility.ToHtmlStringRGB(spriteRenderer.color);
                                GameObject objectC = GameObject.FindWithTag(BoxTag);
                                if (objectC != null)
                                {
                                    SpriteRenderer targetSpriteRenderer = objectC.GetComponent<SpriteRenderer>();
                                    string targetHexColor = ColorUtility.ToHtmlStringRGB(targetSpriteRenderer.color);
                                    if (GameManager.instance.BoxBoosted == false)
                                    {

                                        if (objectHexColor.Equals(targetHexColor))
                                        {
                                            for (int i = 0; i < ScrewHoles.Length; i++)
                                            {
                                                if (ScrewHoles[i].tag != StarSlotTag && ScrewHoles[i].parent.tag == BoxTag)
                                                {
                                                    StarSlotCount++;
                                                }
                                                if (gameObject.tag != StarScrewTag)
                                                {
                                                    if (ScrewHoles[i].parent != null && ScrewHoles[i].parent.tag == BoxTag && ScrewHoles[i].tag != StarSlotTag)
                                                    {
                                                        // Kiểm tra xem lỗ vít hiện tại có ốc chưa
                                                        if (ScrewHoles[i].childCount == 0)
                                                        {
                                                            if (!holeInUse[i])
                                                            {
                                                                holeInUse[i] = true;
                                                                StartCoroutine(ScrewUp());
                                                                // Di chuyển ốc vít đến lỗ vít trống tiếp theo
                                                                StartCoroutine(MoveScrewToHole(i));
                                                                break; // Thoát khỏi vòng lặp sau khi di chuyển ốc
                                                            }
                                                        }
                                                    }
                                                }
                                                else
                                                {
                                                    Debug.Log("B");
                                                    if (ScrewHoles[i].parent != null && ScrewHoles[i].parent.tag == BoxTag && ScrewHoles[i].tag == StarSlotTag)
                                                    {
                                                        // Kiểm tra xem lỗ vít hiện tại có ốc chưa
                                                        if (ScrewHoles[i].childCount == 1)
                                                        {
                                                            if (!holeInUse[i])
                                                            {
                                                                Debug.Log("C");
                                                                holeInUse[i] = true;
                                                                StartCoroutine(ScrewUp());
                                                                // Di chuyển ốc vít đến lỗ vít trống tiếp theo
                                                                StartCoroutine(MoveScrewToHole(i));
                                                                ScrewHoles[i].tag = "Untagged";
                                                                break; // Thoát khỏi vòng lặp sau khi di chuyển ốc
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            Debug.Log(StarSlotCount);
                                            if (gameObject.tag == StarScrewTag && StarSlotCount >= 3)
                                            {
                                                Debug.Log("D");
                                                for (int i = 0; i < WaitHoles.Length; i++)
                                                {
                                                    // Kiểm tra xem lỗ vít hiện tại có ốc chưa
                                                    if (WaitHoles[i].childCount == 0)
                                                    {
                                                        if (!WholeInUse[i])
                                                        {
                                                            WholeInUse[i] = true;
                                                            StartCoroutine(ScrewUp());
                                                            // Di chuyển ốc vít đến lỗ vít trống tiếp theo
                                                            StartCoroutine(MoveScrewToWHole(i));
                                                            break; // Thoát khỏi vòng lặp sau khi di chuyển ốc
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        else
                                        {
                                            for (int i = 0; i < WaitHoles.Length; i++)
                                            {
                                                // Kiểm tra xem lỗ vít hiện tại có ốc chưa
                                                if (WaitHoles[i].childCount == 0)
                                                {
                                                    if (!WholeInUse[i])
                                                    {
                                                        WholeInUse[i] = true;
                                                        StartCoroutine(ScrewUp());
                                                        // Di chuyển ốc vít đến lỗ vít trống tiếp theo
                                                        StartCoroutine(MoveScrewToWHole(i));
                                                        break; // Thoát khỏi vòng lặp sau khi di chuyển ốc
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    // Khi box boosted activate
                                    else
                                    {
                                        GameObject objectD = GameObject.FindWithTag(BoostedTag);
                                        if (objectD != null)
                                        {
                                            SpriteRenderer targetBoostedBox = objectD.GetComponent<SpriteRenderer>();
                                            string targetBoostedHexColor = ColorUtility.ToHtmlStringRGB(targetBoostedBox.color);
                                            if (objectHexColor.Equals(targetHexColor))
                                            {
                                                StarSlotCount = 0;
                                                for (int i = 0; i < ScrewHoles.Length; i++)
                                                {
                                                    if (ScrewHoles[i].tag != StarSlotTag && ScrewHoles[i].parent.tag == BoxTag)
                                                    {
                                                        StarSlotCount++;
                                                    }
                                                    if (gameObject.tag != StarScrewTag)
                                                    {
                                                        if (ScrewHoles[i].parent != null && ScrewHoles[i].parent.tag == BoxTag && ScrewHoles[i].tag != StarSlotTag)
                                                        {
                                                            // Kiểm tra xem lỗ vít hiện tại có ốc chưa
                                                            if (ScrewHoles[i].childCount == 0)
                                                            {
                                                                if (!holeInUse[i])
                                                                {
                                                                    holeInUse[i] = true;
                                                                    StartCoroutine(ScrewUp());
                                                                    // Di chuyển ốc vít đến lỗ vít trống tiếp theo
                                                                    StartCoroutine(MoveScrewToHole(i));
                                                                    break; // Thoát khỏi vòng lặp sau khi di chuyển ốc
                                                                }
                                                            }
                                                        }
                                                    }
                                                    else
                                                    {
                                                        if (ScrewHoles[i].parent != null && ScrewHoles[i].parent.tag == BoxTag && ScrewHoles[i].tag == StarSlotTag)
                                                        {
                                                            // Kiểm tra xem lỗ vít hiện tại có ốc chưa
                                                            if (ScrewHoles[i].childCount == 1)
                                                            {
                                                                if (!holeInUse[i])
                                                                {
                                                                    holeInUse[i] = true;
                                                                    StartCoroutine(ScrewUp());
                                                                    // Di chuyển ốc vít đến lỗ vít trống tiếp theo
                                                                    StartCoroutine(MoveScrewToHole(i));
                                                                    ScrewHoles[i].tag = "Untagged";
                                                                    break; // Thoát khỏi vòng lặp sau khi di chuyển ốc
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                                if (gameObject.tag == StarScrewTag && StarSlotCount >= 3)
                                                {
                                                    for (int i = 0; i < WaitHoles.Length; i++)
                                                    {
                                                        // Kiểm tra xem lỗ vít hiện tại có ốc chưa
                                                        if (WaitHoles[i].childCount == 0)
                                                        {
                                                            if (!WholeInUse[i])
                                                            {
                                                                WholeInUse[i] = true;
                                                                StartCoroutine(ScrewUp());
                                                                // Di chuyển ốc vít đến lỗ vít trống tiếp theo
                                                                StartCoroutine(MoveScrewToWHole(i));
                                                                break; // Thoát khỏi vòng lặp sau khi di chuyển ốc
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            else if (objectHexColor.Equals(targetBoostedHexColor))
                                            {
                                                BoostStarSlotCount = 0;
                                                for (int i = 0; i < ScrewHoles.Length; i++)
                                                {
                                                    if (ScrewHoles[i].tag != StarSlotTag && ScrewHoles[i].parent.tag == BoostedTag)
                                                    {
                                                        BoostStarSlotCount++;
                                                    }
                                                    if (gameObject.tag != StarScrewTag)
                                                    {
                                                        if (ScrewHoles[i].parent != null && ScrewHoles[i].parent.tag == BoostedTag && ScrewHoles[i].tag != StarSlotTag)
                                                        {
                                                            // Kiểm tra xem lỗ vít hiện tại có ốc chưa
                                                            if (ScrewHoles[i].childCount == 0)
                                                            {
                                                                if (!holeInUse[i])
                                                                {
                                                                    holeInUse[i] = true;
                                                                    StartCoroutine(ScrewUp());
                                                                    // Di chuyển ốc vít đến lỗ vít trống tiếp theo
                                                                    StartCoroutine(MoveScrewToHole(i));
                                                                    break; // Thoát khỏi vòng lặp sau khi di chuyển ốc
                                                                }
                                                            }
                                                        }
                                                    }
                                                    else
                                                    {
                                                        if (ScrewHoles[i].parent != null && ScrewHoles[i].parent.tag == BoostedTag && ScrewHoles[i].tag == StarSlotTag)
                                                        {
                                                            // Kiểm tra xem lỗ vít hiện tại có ốc chưa
                                                            if (ScrewHoles[i].childCount == 1)
                                                            {
                                                                if (!holeInUse[i])
                                                                {
                                                                    holeInUse[i] = true;
                                                                    StartCoroutine(ScrewUp());
                                                                    // Di chuyển ốc vít đến lỗ vít trống tiếp theo
                                                                    StartCoroutine(MoveScrewToHole(i));
                                                                    ScrewHoles[i].tag = "Untagged";
                                                                    break; // Thoát khỏi vòng lặp sau khi di chuyển ốc
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                                if (gameObject.tag == StarScrewTag && BoostStarSlotCount >= 3)
                                                {
                                                    for (int i = 0; i < WaitHoles.Length; i++)
                                                    {
                                                        // Kiểm tra xem lỗ vít hiện tại có ốc chưa
                                                        if (WaitHoles[i].childCount == 0)
                                                        {
                                                            if (!WholeInUse[i])
                                                            {
                                                                WholeInUse[i] = true;
                                                                StartCoroutine(ScrewUp());
                                                                // Di chuyển ốc vít đến lỗ vít trống tiếp theo
                                                                StartCoroutine(MoveScrewToWHole(i));
                                                                break; // Thoát khỏi vòng lặp sau khi di chuyển ốc
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            else
                                            {
                                                for (int i = 0; i < WaitHoles.Length; i++)
                                                {
                                                    // Kiểm tra xem lỗ vít hiện tại có ốc chưa
                                                    if (WaitHoles[i].childCount == 0)
                                                    {
                                                        if (!WholeInUse[i])
                                                        {
                                                            WholeInUse[i] = true;
                                                            StartCoroutine(ScrewUp());
                                                            // Di chuyển ốc vít đến lỗ vít trống tiếp theo
                                                            StartCoroutine(MoveScrewToWHole(i));
                                                            break; // Thoát khỏi vòng lặp sau khi di chuyển ốc
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if (GameManager.instance.SetVibration == true)
                                    {
                                        GameManager.instance.Vibrate();
                                    }
                                }
                                if (GameManager.instance.TapAudio.activeSelf == true)
                                {
                                    GameManager.instance.TapAudioSource.Play();
                                }
                                StartCoroutine(DestroyHingeJoint());
                        //}
                    }
                }
            }
        }
        // Chuyển ốc cùng màu từ lỗ tự do đến lỗ hộp cùng màu
        if (GameManager.instance.FullBox == false)
        {
            if (transform.parent.parent != null && transform.parent.parent.tag == HoleTag)
            {
                SpriteRenderer spriteRenderer = GetComponent<SpriteRenderer>();
                string objectHexColor = ColorUtility.ToHtmlStringRGB(spriteRenderer.color);
                GameObject objectC = GameObject.FindWithTag(BoxTag);
                SpriteRenderer targetSpriteRenderer = objectC.GetComponent<SpriteRenderer>();
                string targetHexColor = ColorUtility.ToHtmlStringRGB(targetSpriteRenderer.color);
                if (GameManager.instance.BoxBoosted == false)
                {
                    if (objectHexColor.Equals(targetHexColor))
                    {
                        for (int i = 0; i < ScrewHoles.Length; i++)
                        {
                            if (gameObject.tag != StarScrewTag)
                            {
                                if (ScrewHoles[i].parent != null && ScrewHoles[i].parent.tag == BoxTag && ScrewHoles[i].tag != StarSlotTag)
                                {
                                    // Kiểm tra xem lỗ vít hiện tại có ốc chưa
                                    if (ScrewHoles[i].childCount == 0)
                                    {
                                        if (!holeInUse[i])
                                        {
                                            StartCoroutine(DelayWaitingHole());
                                            // Di chuyển ốc vít đến lỗ vít trống tiếp theo
                                            if (SetHole == true)
                                            {
                                                StartCoroutine(ScrewUp());
                                                StartCoroutine(MoveScrewToHole(i));
                                            }
                                            return; // Thoát khỏi vòng lặp sau khi di chuyển ốc
                                        }
                                    }
                                }
                            }
                            else
                            {
                                if (ScrewHoles[i].parent != null && ScrewHoles[i].parent.tag == BoxTag && ScrewHoles[i].tag == StarSlotTag)
                                {
                                    // Kiểm tra xem lỗ vít hiện tại có ốc chưa
                                    if (ScrewHoles[i].childCount == 1)
                                    {
                                        if (!holeInUse[i])
                                        {
                                            StartCoroutine(DelayWaitingHole());
                                            // Di chuyển ốc vít đến lỗ vít trống tiếp theo
                                            if (SetHole == true)
                                            {
                                                StartCoroutine(ScrewUp());
                                                StartCoroutine(MoveScrewToHole(i));
                                            }
                                            return; // Thoát khỏi vòng lặp sau khi di chuyển ốc
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                else
                {
                    GameObject objectD = GameObject.FindWithTag(BoostedTag);
                    if (objectD != null)
                    {
                        SpriteRenderer targetBoostedBox = objectD.GetComponent<SpriteRenderer>();
                        string targetBoostedHexColor = ColorUtility.ToHtmlStringRGB(targetBoostedBox.color);
                        if (objectHexColor.Equals(targetHexColor))
                        {
                            for (int i = 0; i < ScrewHoles.Length; i++)
                            {
                                if (gameObject.tag != StarScrewTag)
                                {
                                    if (ScrewHoles[i].parent != null && ScrewHoles[i].parent.tag == BoxTag && ScrewHoles[i].tag != StarSlotTag)
                                    {
                                        // Kiểm tra xem lỗ vít hiện tại có ốc chưa
                                        if (ScrewHoles[i].childCount == 0)
                                        {
                                            if (!holeInUse[i])
                                            {
                                                StartCoroutine(DelayWaitingHole());
                                                // Di chuyển ốc vít đến lỗ vít trống tiếp theo
                                                if (SetHole == true)
                                                {
                                                    StartCoroutine(ScrewUp());
                                                    StartCoroutine(MoveScrewToHole(i));
                                                }
                                                return; // Thoát khỏi vòng lặp sau khi di chuyển ốc
                                            }
                                        }
                                    }
                                }
                                else
                                {
                                    if (ScrewHoles[i].parent != null && ScrewHoles[i].parent.tag == BoxTag && ScrewHoles[i].tag == StarSlotTag)
                                    {
                                        // Kiểm tra xem lỗ vít hiện tại có ốc chưa
                                        if (ScrewHoles[i].childCount == 1)
                                        {
                                            if (!holeInUse[i])
                                            {
                                                StartCoroutine(DelayWaitingHole());
                                                // Di chuyển ốc vít đến lỗ vít trống tiếp theo
                                                if (SetHole == true)
                                                {
                                                    StartCoroutine(ScrewUp());
                                                    StartCoroutine(MoveScrewToHole(i));
                                                }
                                                return; // Thoát khỏi vòng lặp sau khi di chuyển ốc
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        else if (objectHexColor.Equals(targetBoostedHexColor))
                        {
                            for (int i = 0; i < ScrewHoles.Length; i++)
                            {
                                if (gameObject.tag != StarScrewTag)
                                {
                                    if (ScrewHoles[i].parent != null && ScrewHoles[i].parent.tag == BoostedTag && ScrewHoles[i].tag != StarSlotTag)
                                    {
                                        // Kiểm tra xem lỗ vít hiện tại có ốc chưa
                                        if (ScrewHoles[i].childCount == 0)
                                        {
                                            if (!holeInUse[i])
                                            {
                                                StartCoroutine(DelayWaitingHole());
                                                // Di chuyển ốc vít đến lỗ vít trống tiếp theo
                                                if (SetHole == true)
                                                {
                                                    StartCoroutine(ScrewUp());
                                                    StartCoroutine(MoveScrewToHole(i));
                                                }
                                                return; // Thoát khỏi vòng lặp sau khi di chuyển ốc
                                            }
                                        }
                                    }
                                }
                                else
                                {
                                    if (ScrewHoles[i].parent != null && ScrewHoles[i].parent.tag == BoostedTag && ScrewHoles[i].tag == StarSlotTag)
                                    {
                                        // Kiểm tra xem lỗ vít hiện tại có ốc chưa
                                        if (ScrewHoles[i].childCount == 1)
                                        {
                                            if (!holeInUse[i])
                                            {
                                                StartCoroutine(DelayWaitingHole());
                                                // Di chuyển ốc vít đến lỗ vít trống tiếp theo
                                                if (SetHole == true)
                                                {
                                                    StartCoroutine(ScrewUp());
                                                    StartCoroutine(MoveScrewToHole(i));
                                                }
                                                return; // Thoát khỏi vòng lặp sau khi di chuyển ốc
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        // Check trạng thái của hộp 
        if (GameManager.instance.BoxBoosted == false)
        {
            foreach (Transform hole in ScrewHoles)
            {
                if (hole.parent.tag == BoxTag && hole.parent != null && hole.tag != StarSlotTag)
                {
                    if (hole.childCount == 0)
                    {
                        GameManager.instance.FullBox = false; 
                    }
                    else
                    {
                        holeFullCount++;
                        Debug.Log("A"+holeFullCount);
                    }
                }
                else if (hole.parent.tag == BoxTag && hole.parent != null && hole.tag == StarSlotTag)
                {
                    if (hole.childCount == 1)
                    {
                        GameManager.instance.FullBox = false;
                    }
                    else if (hole.childCount == 2)
                    {
                        holeFullCount++;
                        Debug.Log("D"+holeFullCount);
                    }
                }
            }
        }
        else
        {
            foreach (Transform hole in ScrewHoles)
            {
                if (hole.parent.tag == BoxTag || hole.parent.tag == BoostedTag)
                {
                    if (hole.parent != null && hole.tag != StarSlotTag)
                    {
                        if (hole.childCount == 0)
                        {
                            GameManager.instance.FullBox = false;
                        }
                        else
                        {
                            holeFullCount++;
                            Debug.Log("B" + holeFullCount);
                        }
                    }
                    else if (hole.parent != null && hole.tag == StarSlotTag)
                    {
                        if (hole.childCount <= 1)
                        {
                            GameManager.instance.FullBox = false;
                        }
                        else if (hole.childCount == 2)
                        {
                            holeFullCount++;
                            Debug.Log("C" + holeFullCount);
                        }
                    }
                }

            }
        }
        // Check lo da duoc lap day
        foreach (Transform Whole in WaitHoles)
        {
            if (Whole.tag == HoleTag)
            {
                if (Whole.childCount == 1)
                {
                    HoleWaitingCount++;
                }
            }
        }
        // Check lo trong hop da duoc lap day
        if (GameManager.instance.BoxBoosted == false)
        {
            if (holeFullCount >= 3)
            {
                Debug.Log("3 lo");
                StarSlotCount = 0;
                StartCoroutine(AfterFullBox());
                if (SetTrue)
                {
                    GameManager.instance.FullBox = true;
                }
                else
                {
                    GameManager.instance.FullBox = false;
                }
            }
        }
        else {
            if (holeFullCount >= 6)
            {
                Debug.Log("6 lỗ");
                StarSlotCount = 0;
                StartCoroutine(AfterFullBox());
                if (SetTrue)
                {
                    GameManager.instance.FullBox = true;
                }
                else
                {
                    GameManager.instance.FullBox = false;
                }
                //Invoke("SetBoostedBox", 3f);
            }
        }
        CheckLoss();
    }
IEnumerator MoveScrewToHole(int index) // Di chuyển ốc đến lỗ
    {
        Vector3 hole = ScrewHoles[index].position;
        transform.parent.SetParent(ScrewHoles[index].transform, true);
        float Distance = Vector3.Distance(transform.position, hole);
        float duration = Distance / speed;
        yield return new WaitForSeconds(1f);
        Tween MoveScrew = transform.parent.DOMove(hole, duration);
        MoveScrew.SetEase(Ease.OutCubic);
        MoveScrew.OnComplete(() => // làm gì sau khi di chuyển tới nơi 
        {
            if (holeFullCount < 3)
            {
                GameManager.instance.FullBox = false;
            }
        });
    }
IEnumerator MoveScrewToWHole(int index) //Di chuyển ốc đến lỗ đợi
    {
        Transform Whole = WaitHoles[index];
        transform.parent.SetParent(WaitHoles[index].transform, true);
        float Distance = Vector3.Distance(transform.position, Whole.position);
        float duration = Distance / speed;
        yield return new WaitForSeconds(1f);
        Tween MoveScrew = transform.parent.DOMove(Whole.position, duration);
        MoveScrew.SetEase(Ease.OutCubic);
        MoveScrew.OnComplete(() => // làm gì sau khi di chuyển tới nơi 
        {
        });
    }
IEnumerator DestroyHingeJoint() //phá khớp
    {
        yield return new WaitForSeconds(0.7f);
        HingeJoint2D hingeJoint = GetComponent<HingeJoint2D>();

        if (hingeJoint != null)
        {
            Rigidbody2D connectedBody = hingeJoint.connectedBody;

            if (connectedBody != null)
            {
                Destroy(hingeJoint);
            }
        }
    }
    IEnumerator AfterFullBox()
    {
        yield return new WaitForSeconds(1.9f);
        SetTrue = true;
        yield return new WaitForSeconds(0.5f);
        SetTrue = false;
    }
    IEnumerator DelayWaitingHole()
    {
        yield return new WaitForSeconds(1.9f);
        SetHole = true;
        yield return new WaitForSeconds(0.5f);
        SetHole = false;
    }
    IEnumerator ScrewUp()
    {
        Debug.Log("Chay anim");
        animator.SetBool("Click",true);
        yield return new WaitForSeconds(1f);
        animator.SetBool("Click", false);
    }
    public void OnKPPopUp()
    {
        GameManager.instance.OnKeepPlayingPopUp();
    }
    public void OnLossPopUp()
    {
        GameManager.instance.OnYALPopUp();
    }
    public void CheckLoss()
    {
        if (HoleWaitingCount == ActiveWholesIndex && CheckPopUp == true )
        {
            CheckPopUp = false;
            if (HoleWaitingCount < 9)
            {
                Invoke("OnKPPopUp", 1f);
            }
            else if (HoleWaitingCount == 9)
            {
                Invoke("OnLossPopUp", 1f);
            }
        }
    }
    public void SetBoostedBox()
    {
        GameManager.instance.BoxBoosted = false;
    }
    public void ClickedScrew()
    {
       
    }
    public void FreeHoleToBox()
    {

    }
}
